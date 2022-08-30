//
//  StationsVM.swift
//  ChargingStationsApp
//
//  Created by Alaattin Bedir on 30.08.2022.
//

import Foundation
import MLBasicKit
import Combine

class StationsVM: BaseVM {
    @Published var stationTitle: String? = nil
    @Published var stations: StationsResponse? = nil
}


extension StationsVM {
    func fetchChargingStations() {
        let params: [String: Any] = ["key": Keeper.shared.APIKey,
                                     "distance": Keeper.shared.distance,
                                     "latitude": Keeper.shared.latitude,
                                     "longitude": Keeper.shared.longitude]
        StationsApi().fetchStations(params: params) { [weak self] (stations) in
            guard let self = self else { return }
            self.stations = stations
            self.stationTitle = stations[0].addressInfo?.title ?? "Empty Title"
            print(self.stationTitle)
        } failed: { error in
            print(error)
        }
    }
}
