//
//  Keeper.swift
//  ChargingStationsApp
//
//  Created by Alaattin Bedir on 30.08.2022.
//

import Foundation

class Keeper {
    static let shared = Keeper()

    var currentEnvironment: AppDomain = .production {
        didSet {
            if let appGroupUserDefault = UserDefaults(suiteName: "CurrentEnvironment") {
                appGroupUserDefault
                    .set(currentEnvironment.domainUrl, forKey: "DomainUrl")
            }
        }
    }

    let APIKey = "1e2cb9c6-a0e9-4a68-bc09-f3c97a6bd8e4"

    let distance = 5

    let latitude = 52.526

    let longitude = 13.415
}
