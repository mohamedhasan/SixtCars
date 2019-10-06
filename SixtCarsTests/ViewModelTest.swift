//
//  ViewModelTest.swift
//  SixtCarsTests
//
//  Created by Mohamed Hassan on 10/6/19.
//  Copyright © 2019 Mohamed Hassan. All rights reserved.
//

import XCTest

class ViewModelTest: XCTestCase {

    var carListMock:[CarModel]?
    override func setUp() {
        if let path = Bundle(for: type(of: self)).path(forResource: "response", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                carListMock = try decoder.decode([CarModel].self, from: data)
            }
            catch {
                assert(false)
            }
        }
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testListExist() {
        XCTAssertNotNil(carListMock)
    }

    func testModelText() {
        if let car = carListMock?.first {
            let viewModel = CarViewModel(model:car)
            XCTAssertNotNil(viewModel.modelText())
        } else {
            XCTAssert(false)
        }
    }
    
    func testTransmissionImage() {
        if let car = carListMock?.first {
            let viewModel = CarViewModel(model:car)
            XCTAssertNotNil(viewModel.transmissionImage())
        } else {
            XCTAssert(false)
        }
    }
    

}
