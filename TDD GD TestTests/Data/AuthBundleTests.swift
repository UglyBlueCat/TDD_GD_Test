//
//  AuthBundleTests.swift
//  TDD GD Test
//
//  Created by Robin Spinks on 03/05/2017.
//  Copyright © 2017 Robin Spinks. All rights reserved.
//

import XCTest
@testable import TDD_GD_Test

class AuthBundleTests: XCTestCase {
    
    func testClassExists() {
        let _ : AuthBundle = AuthBundle()
    }
    
    func testInstanceNotNull() {
        let authBundle : AuthBundle = AuthBundle()
        
        XCTAssertNotNil(authBundle)
    }
    
    func testParameters() {
        let authBundle : AuthBundle = AuthBundle()
        
        XCTAssertNotNil(authBundle.access_token)
        XCTAssertNotNil(authBundle.token_type)
        XCTAssertNotNil(authBundle.expires_in)
    }
    
    func testParamInit() {
        let authBunTestDic : Dictionary<String, Any> = [
            "access_token" : "tHzU5jsrJcKdWmZabc2BLfC0TGxuAb0DtcmFpctHtUxVliLM65Ca2qW1Lu3jyzZ00AOtS_qgS9QtsL1hsLOObg7iuBlpAPzaDgDo2Xof2ZGq0p_wAQSjthXx3DDsOpBj3ufGQuNBgwYDFVU3XtD0UCi2G5PLQbJy-UyervGsj4afTprwEhEDDV0DnWBFQ_GvuWZa2R1v5ulf0X4AQ9-3XeT8KHS_aAfS5ZBg-9sK-wLgbrpjLT4PdOWAkqysjsOIsIJUA6iAtgGrrwUEkp_BexXBjpSMoLxBAbEFU37f2JCFkdluWTyQrhDyoGEU1xTzr6TIQ_BPVVpQwf6YLw4HIgIiTKzQ0H4LtMci66TqvIdJg1S3c5c7EsrRDP5phNAu0XEkDes4oBovNybFptTmh1lPdrj-Dsh938hVtW48C5WQRQ_Tc0SlIKzfPFXis-N9SnRKUmflYXWnkkjJ8aW696F3sRHCoI4OYgZidtI60lmV5Dmi_D4vQMrx1qW-P4P7qBIEoZAQ0KnGeV0czCylf0YA",
            "token_type" : "bearer",
            "expires_in" : 86399]
        
        let authBundle : AuthBundle = AuthBundle(authDic : authBunTestDic)
        
        XCTAssert(authBundle.access_token == authBunTestDic["access_token"] as! String)
        XCTAssert(authBundle.token_type == authBunTestDic["token_type"] as! String)
        XCTAssert(authBundle.expires_in == authBunTestDic["expires_in"] as! Int)
    }
}
