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

class StationsVC: BaseVC<StationsVM> {
    // MARK: - Vars & Lets
    var subscribers: [AnyCancellable] = []

    // MARK: - Outlets
    @IBOutlet weak var stationTitle: UILabel! {
        didSet {
            viewModel.$stationTitle
                .map{($0)}
                .receive(on: DispatchQueue.main)
                .assign(to: \.text, on: stationTitle)
                .store(in: &subscribers)
        }
    }

    // MARK: - Controller lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.fetchChargingStations()
    }
}
