//
//  ProfileTests.swift
//  TDD GD Test
//
//  Created by Robin Spinks on 03/05/2017.
//  Copyright © 2017 Robin Spinks. All rights reserved.
//

import XCTest
@testable import TDD_GD_Test

class ProfileTests: XCTestCase {
    
    func testClassExists() {
        let _ : Profile = Profile()
    }
    
    func testInstanceNotNull() {
        let profile : Profile = Profile()
        
        XCTAssertNotNil(profile)
    }
    
    func testParameters() {
        let profile : Profile = Profile()
        
        XCTAssertNotNil(profile.headline)
        XCTAssertNotNil(profile.linkStatus)
        XCTAssertNotNil(profile.lastActive)
        XCTAssertNotNil(profile.age)
        XCTAssertNotNil(profile.isTravelling)
        XCTAssertNotNil(profile.profileId)
        XCTAssertNotNil(profile.profileName)
        XCTAssertNotNil(profile.profileType)
        XCTAssertNotNil(profile.mainMediaId)
        XCTAssertNotNil(profile.isFavourite)
        XCTAssertNotNil(profile.isOnline)
        XCTAssertNotNil(profile.distance)
    }
    
    func testParamInit() {
        let profileTestDic : Dictionary<String, Any> = [
            "headline":"Looking for a bf in london",
            "linkStatus":0,
            "lastActive":"2017-05-02T15:10:06.1566667",
            "age": 40,
            "isTravelling":false,
            "profileId":5896886,
            "profileName":"oojamaflip2008",
            "profileType":0,
            "mainMediaId":"da36f95b-d3ab-4724-913a-5664c62fcb84",
            "isFavourite":false,
            "isOnline":true,
            "distance":"Less than 300 feet"]
        
        let profile : Profile = Profile(profileDic : profileTestDic)
        
        XCTAssert(profile.headline == profileTestDic["headline"] as! String)
        XCTAssert(profile.linkStatus == profileTestDic["linkStatus"] as! Int)
        XCTAssert(profile.lastActive == profileTestDic["lastActive"] as! String)
        XCTAssert(profile.age == profileTestDic["age"] as! Int)
        XCTAssert(profile.isTravelling == profileTestDic["isTravelling"] as! Bool)
        XCTAssert(profile.profileId == profileTestDic["profileId"] as! Int)
        XCTAssert(profile.profileName == profileTestDic["profileName"] as! String)
        XCTAssert(profile.profileType == profileTestDic["profileType"] as! Int)
        XCTAssert(profile.mainMediaId == profileTestDic["mainMediaId"] as! String)
        XCTAssert(profile.isFavourite == profileTestDic["isFavourite"] as! Bool)
        XCTAssert(profile.isOnline == profileTestDic["isOnline"] as! Bool)
        XCTAssert(profile.distance == profileTestDic["distance"] as! String)
    }
}
