//
//  StationsApiServiceStub.swift
//  ChargingStationsAppTests
//
//  Created by Alaattin Bedir on 1.09.2022.
//

@testable import ChargingStationsApp
import Foundation
import MLNetworking
import XCTest

class StationsApiServiceStub: StationsApiService {

    override func fetchStations(params: [String : Any]?,
                                succeed: @escaping (StationsResponse) -> Void,
                                failed: @escaping (ErrorMessage) -> Void) {

        var response = StationsResponse()

        let addresInfo1 = AddressInfo(postcode: "10178",
                                     addressLine1: "Karl-Liebknecht-Straße 29",
                                     countryID: 87,
                                     id: 87785,
                                     addressLine2: "Mitte",
                                     stateOrProvince: "Berlin",
                                     latitude: 52.524438232115585,
                                     longitude: 13.412951344982966,
                                     distance: 0.13806898020227792,
                                     distanceUnit: 2,
                                     title: "Karl-Liebknecht-Straße",
                                     town: "Berlin",
                                     accessComments: "24/7 nutzbar mit 2 kostenlosen Parkplätzen.")
        let station1 = StationsResponseElement(addressInfo: addresInfo1, numberOfPoints: 2)

        let addresInfo2 = AddressInfo(postcode: "10405",
                                     addressLine1: "Straßburger Str. 2",
                                     countryID: 87,
                                     id: 183796,
                                     addressLine2: nil,
                                     stateOrProvince: "Berlin",
                                     latitude: 52.528486,
                                     longitude: 13.412186,
                                     distance: 0.20856846975121768,
                                     distanceUnit: 2,
                                     title: "Straßburger Str. 2",
                                     town: "Berlin",
                                     accessComments: nil)
        let station2 = StationsResponseElement(addressInfo: addresInfo2, numberOfPoints: 3)

        response.append(station1)
        response.append(station2)

        succeed(response)
    }

}
