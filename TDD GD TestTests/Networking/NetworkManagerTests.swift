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
    
    func testURLSession() {
        XCTAssertNotNil(networkManager.urlSession)
    }
    
    // Test relies on network connectivity - possibly improved by mocking
    func testCanHandleRequest() {
        if let url : URL = URL(string: "https://account-live.cpcconnect.net/auth/token") {
            let expect = expectation(description: "waitForNetworkManager")
            
            var testData : Data = Data()
            let urlRequest : URLRequest = URLRequest(url: url)
            networkManager.handleRequest(request: urlRequest, completion: {
                (data, urlResponse, error) in
                guard error == nil else {
                    XCTFail("error: \(String(describing: error))")
                    return
                }
                guard data != nil else {
                    XCTFail("null data")
                    return
                }
                testData = data!
                expect.fulfill()
            })
            
            waitForExpectations(timeout: 15, handler: nil)
            XCTAssert(testData.count > 0)
        } else {
            XCTFail("")
        }
    }
    
    // Test relies on network connectivity - possibly improved by mocking
    func testRequestHandling() {
        let expect = expectation(description: "waitForNetworkManager")
        
        var testData : Data = Data()
        let apiURL : String = "https://account-live.cpcconnect.net/auth/token"
        let params : Dictionary<String, String> = [:]
        let headers : Dictionary<String, String> = ["Content-Type" : "application/x-www-form-urlencoded"]
        let jsonBody = ["grant_type" : "password",
                        "username" : "oojamaflip2008",
                        "password" : "TestPassword123!"]
        let body : Data = NSKeyedArchiver.archivedData(withRootObject: jsonBody)
        
        networkManager.postRequest(headers: headers,
                                   params: params,
                                   body: body,
                                   urlStr: apiURL) {
            (data, urlResponse, error) in
            guard error == nil else {
                XCTFail("error: \(String(describing: error))")
                return
            }
            guard data != nil else {
                XCTFail("null data")
                return
            }
            testData = data!
            expect.fulfill()
        }
        
        waitForExpectations(timeout: 15, handler: nil)
        XCTAssert(testData.count > 0)
    }
}
