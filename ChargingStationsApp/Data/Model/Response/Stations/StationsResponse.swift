//
//  StationsResponse.swift
//  ChargingStationsApp
//
//  Created by Alaattin Bedir on 30.08.2022.
//

import Foundation

// MARK: - StationsResponseElement
struct StationsResponseElement: Codable {
    let addressInfo: AddressInfo?
    let numberOfPoints: Int?

    enum CodingKeys: String, CodingKey {
        case addressInfo = "AddressInfo"
        case numberOfPoints = "NumberOfPoints"
    }
}

// MARK: - AddressInfo
struct AddressInfo: Codable {
    let postcode, addressLine1: String?
    let countryID, id: Int?
    let addressLine2, stateOrProvince: String?
    let latitude: Double?
    let longitude, distance: Double?
    let distanceUnit: Int?
    let title, town: String?
    let accessComments: String?
    let country: Country?

    enum CodingKeys: String, CodingKey {
        case postcode = "Postcode"
        case addressLine1 = "AddressLine1"
        case countryID = "CountryID"
        case id = "ID"
        case addressLine2 = "AddressLine2"
        case stateOrProvince = "StateOrProvince"
        case latitude = "Latitude"
        case longitude = "Longitude"
        case distance = "Distance"
        case distanceUnit = "DistanceUnit"
        case title = "Title"
        case town = "Town"
        case accessComments = "AccessComments"
        case country = "Country"
    }
}

// MARK: - Country
struct Country: Codable {
    let continentCode: String?
    let id: Int?
    let title, isoCode: String?

    enum CodingKeys: String, CodingKey {
        case continentCode = "ContinentCode"
        case id = "ID"
        case title = "Title"
        case isoCode = "ISOCode"
    }
}

typealias StationsResponse = [StationsResponseElement]

