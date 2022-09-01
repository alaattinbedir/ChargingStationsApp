//
//  StationsVMTests.swift
//  ChargingStationsAppTests
//
//  Created by Alaattin Bedir on 1.09.2022.
//

import XCTest
import Combine
@testable import ChargingStationsApp

class StationsVMTests: XCTestCase {

    var viewModel: StationsVM!
    var subscribers: [AnyCancellable] = []
    
    override func setUpWithError() throws {
        viewModel = StationsVM(apiService: StationsApiServiceStub())
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testFetchChargingStations() throws {
        let expectation = expectation(description: "wait for service operation to be completed")

        viewModel.fetchChargingStations()
        expectation.fulfill()

        waitForExpectations(timeout: 5, handler: nil)

        XCTAssertNotNil(viewModel.artworks)
        XCTAssertEqual(viewModel.artworks.count, 2)
    }    
}
