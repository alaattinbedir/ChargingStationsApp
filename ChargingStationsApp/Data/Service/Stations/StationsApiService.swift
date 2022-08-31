//
//  StationsApi.swift
//  ChargingStationsApp
//
//  Created by Alaattin Bedir on 30.08.2022.
//

import Foundation
import MLNetworking

// MARK: - Stations Api Service Protocol

protocol StationsApiServiceProtocol {
    func fetchStations(params: [String: Any]?,
                       succeed:@escaping (StationsResponse) -> Void,
                       failed:@escaping (ErrorMessage) -> Void)
}

// MARK: - Stations Api Service Implementation

class StationsApiService: StationsApiServiceProtocol {
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
