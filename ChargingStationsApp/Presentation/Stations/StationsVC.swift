//
//  StationsVC.swift
//  ChargingStationsApp
//
//  Created by Alaattin Bedir on 30.08.2022.
//

import UIKit
import MLBasicKit
import Combine
import MapKit

class StationsVC: BaseVC<StationsVM> {
    // MARK: - Vars & Lets
    var subscribers: [AnyCancellable] = []
    var locationUpdateTimer: Timer?

    // MARK: - Outlets
    
    @IBOutlet weak var mapView: MKMapView! {
        didSet {
            mapView.delegate = self
            mapView.register(
                ArtworkView.self,
                forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)

            viewModel.$artworks
                .receive(on: DispatchQueue.main)
                .sink { [weak self] (artworks) in
                    guard let self = self else { return }
                    self.mapView.addAnnotations(artworks)
                }
                .store(in: &subscribers)
        }
    }
    
    // MARK: - Controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
        viewModel.fetchChargingStations()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopTimer()
    }

    func stopTimer()     {
        if locationUpdateTimer != nil {
            locationUpdateTimer!.invalidate()
            locationUpdateTimer = nil
        }
    }

    deinit {
        stopTimer()
    }
}

// MARK: Configure the components

extension StationsVC {
    func bind() {
        configureMapView()
        configureTimer()
    }

    func configureTimer() {
        viewModel.$loadingState
            .sink { [weak self] (loadingState) in
                guard let self = self else { return }
                
                switch loadingState {
                case .loading:
                    self.stopTimer()
                    break
                case .succes:
                    self.startTimer()
                    break
                case .failed:
                    self.startTimer()
                    break
                case .none:
                    self.stopTimer()
                    break
                }
            }
            .store(in: &subscribers)
    }

    func startTimer() {
        if locationUpdateTimer == nil {
            locationUpdateTimer = Timer.scheduledTimer(timeInterval: 30, target: self, selector: #selector(runLocationTimer), userInfo: nil, repeats: true)
        }
    }

    @objc func runLocationTimer() {
        viewModel.fetchChargingStations()
    }

    func configureMapView() {
        // Set initial location in Berlin
        let initialLocation = CLLocation(latitude: Keeper.shared.latitude, longitude: Keeper.shared.longitude)
        mapView.centerToLocation(initialLocation)

        let berlinCenter = CLLocation(latitude: Keeper.shared.latitude, longitude: Keeper.shared.longitude)
        let region = MKCoordinateRegion(
            center: berlinCenter.coordinate,
            latitudinalMeters: 50000,
            longitudinalMeters: 60000)
        mapView.setCameraBoundary(
            MKMapView.CameraBoundary(coordinateRegion: region),
            animated: true)

        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 200000)
        mapView.setCameraZoomRange(zoomRange, animated: true)
    }
}

private extension MKMapView {
    func centerToLocation(_ location: CLLocation, regionRadius: CLLocationDistance = Double(Keeper.shared.distance) * 1000) {
        let coordinateRegion = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius)
        setRegion(coordinateRegion, animated: true)
    }
}

// MARK: - MapView Delegate

extension StationsVC: MKMapViewDelegate {
    func mapView(
        _ mapView: MKMapView,
        annotationView view: MKAnnotationView,
        calloutAccessoryControlTapped control: UIControl
    ) {
        guard let artwork = view.annotation as? Artwork else {
            return
        }
        
        let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        artwork.mapItem?.openInMaps(launchOptions: launchOptions)
    }
}
