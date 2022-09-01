//
//  StationsVM.swift
//  ChargingStationsApp
//
//  Created by Alaattin Bedir on 30.08.2022.
//

import Foundation
import MLBasicKit
import Combine
import CoreLocation

class StationsVM: BaseVM {
    @Published var artworks: [Artwork] = []

    private let apiService: StationsApiServiceProtocol

    required convenience init() {
        self.init(apiService: StationsApiService())
    }

    nonisolated init (apiService: StationsApiServiceProtocol = StationsApiService()) {
        self.apiService = apiService
        super.init()
    }
}

extension StationsVM {
    func fetchChargingStations() {
        let params: [String: Any] = ["distance": Keeper.shared.distance,
                                     "latitude": Keeper.shared.latitude,
                                     "longitude": Keeper.shared.longitude]

        self.loadingState = .loading
        apiService.fetchStations(params: params) { [weak self] (stations) in
            guard let self = self else { return }

            self.artworks = stations.map {
                let title = $0.addressInfo?.title
                let addressLine1 = $0.addressInfo?.addressLine1 ?? ""
                let addressLine2 = $0.addressInfo?.addressLine2 ?? ""
                let town = $0.addressInfo?.town ?? ""
                let latitude = $0.addressInfo?.latitude ?? 0.0
                let longitude = $0.addressInfo?.longitude ?? 0.0
                let numberOfChargingPoints = $0.numberOfPoints ?? 0
                let address = addressLine1 + " " + addressLine2 + " " + town + "\n" + "Charging points: \(numberOfChargingPoints)"
                let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)

                return Artwork(title: title, chargingStationAddress: address, numberOfChargingPoints: numberOfChargingPoints, coordinate: location)
            }

            self.loadingState = .succes

        } failed: { error in
            self.loadingState = .failed
            print(error)
        }
    }
}
