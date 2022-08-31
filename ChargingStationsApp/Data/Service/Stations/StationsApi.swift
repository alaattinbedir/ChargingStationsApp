//
//  StationsApi.swift
//  ChargingStationsApp
//
//  Created by Alaattin Bedir on 30.08.2022.
//

import Foundation
import MLNetworking

// MARK: - Stations model extension

class StationsApi {
    func fetchStations(params: [String: Any]?,
                       succeed:@escaping (StationsResponse) -> Void,
                       failed:@escaping (ErrorMessage) -> Void) {

            let headerParams = ["X-API-Key": Keeper.shared.APIKey]

            BaseAPI.shared.request(methotType: .get,
                                   baseURL: Keeper.shared.currentEnvironment.domainUrl,
                                   endPoint: Endpoints.stations,
                                   params: params,
                                   headerParams: headerParams) { (response: StationsResponse) in
                succeed(response)
            } failed: { (errorMessage: ErrorMessage) in
                failed(errorMessage)
            }
    }
}
