//
//  ServiceTests.swift
//  HelloFreshTests
//
//  Created by Saiefeddine HAYOUNI on 06/12/2021.
//

import XCTest
@testable import HelloFresh

class ServiceTests: XCTestCase {

    var service: ServiceMock!

    override func setUp() {
        self.service = ServiceMock()
    }

    func testFetchDataService() throws {
        service.getRecepiesList { recipeEntities in
            XCTAssertEqual(recipeEntities?.count, 10)
        }
    }
}
