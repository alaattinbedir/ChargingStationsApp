//
//  StationsVMSpec.swift
//  ChargingStationsAppTests
//
//  Created by Alaattin Bedir on 1.09.2022.
//

//import Foundation
//
//@testable import ChargingStationsApp
//import Quick
//import Nimble
//import Combine
//
//class StationsVMSpec: QuickSpec {
//
//    var subscribers: [AnyCancellable] = []
//
//    override func spec() {
//
//        var viewModel: StationsVM!
//
//        describe("Stations ViewModel tests") {
//
//            beforeEach {
//                viewModel = StationsVM(apiService: StationsApiServiceStub())
//            }
//
//            context("ViewModel opened") {
//                it("Init test") {
//                    _ = StationsVM()
//                    expect(true) == true
//                }
//            }
//
//            context("ViewModel functionality test") {
//                it("Fetch charging stations") {
//                    viewModel.fetchChargingStations()
//
//                    waitUntil { done in
//                        viewModel.$artworks
//                            .receive(on: DispatchQueue.main)
//                            .sink { artworks in
//                                if !artworks.isEmpty, artworks.count == 2 {
//                                    done()
//                                }
//                            }.store(in: &self.subscribers)
//                    }
//                }
//            }
//        }
//    }
//}
