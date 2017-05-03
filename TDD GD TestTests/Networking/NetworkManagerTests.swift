//
//  NetworkManagerTests.swift
//  TDD GD Test
//
//  Created by Robin Spinks on 03/05/2017.
//  Copyright © 2017 Robin Spinks. All rights reserved.
//

import XCTest
@testable import TDD_GD_Test

class NetworkManagerTests: XCTestCase {
    
    let networkManager : NetworkManager = NetworkManager()
    
    func testNetworkManagerExists() {
        XCTAssertNotNil(networkManager)
    }
    
}
