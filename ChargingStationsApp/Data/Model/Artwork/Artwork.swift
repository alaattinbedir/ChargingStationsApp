//
//  Artwork.swift
//  ChargingStationsApp
//
//  Created by Alaattin Bedir on 31.08.2022.
//

import Foundation
import MapKit
import Contacts

import MapKit

class Artwork: NSObject, MKAnnotation {
    let title: String?
    let chargingStationAddress: String?
    let numberOfChargingPoints: Int?
    let coordinate: CLLocationCoordinate2D

    init(
        title: String?,
        chargingStationAddress: String?,
        numberOfChargingPoints: Int?,
        coordinate: CLLocationCoordinate2D
    ) {
        self.title = title
        self.chargingStationAddress = chargingStationAddress
        self.numberOfChargingPoints = numberOfChargingPoints
        self.coordinate = coordinate

        super.init()
    }

    var subtitle: String? {
        return chargingStationAddress
    }

    var mapItem: MKMapItem? {
        guard let address = chargingStationAddress else {
            return nil
        }

        let addressDict = [CNPostalAddressStreetKey: address]
        let placemark = MKPlacemark(
            coordinate: coordinate,
            addressDictionary: addressDict)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = title
        return mapItem
    }
}
