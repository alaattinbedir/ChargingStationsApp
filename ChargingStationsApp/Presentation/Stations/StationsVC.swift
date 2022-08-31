//
//  StationsVC.swift
//  ChargingStationsApp
//
//  Created by Alaattin Bedir on 30.08.2022.
//

import Foundation
import UIKit
import MLBasicKit
import Combine
import MapKit

class StationsVC: BaseVC<StationsVM> {
    // MARK: - Vars & Lets
    var subscribers: [AnyCancellable] = []
    
    // MARK: - Outlets
    
    @IBOutlet weak var mapView: MKMapView!
    
    // MARK: - Controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        mapView.delegate = self
        
        mapView.register(
            ArtworkView.self,
            forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        
        viewModel.fetchChargingStations()
        
        viewModel.$artworks
            .receive(on: DispatchQueue.main)
            .sink { [weak self] (artworks) in
                guard let self = self else { return }
                self.mapView.addAnnotations(artworks)
            }
            .store(in: &subscribers)
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
