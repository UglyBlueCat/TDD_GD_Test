//
//  Profile.swift
//  TDD GD Test
//
//  Created by Robin Spinks on 03/05/2017.
//  Copyright © 2017 Robin Spinks. All rights reserved.
//

import Foundation

class Profile {
    var headline : String = ""
    var linkStatus : Int = 0
    var lastActive : String = ""
    var age : Int = 0
    var isTravelling : Bool = false
    var profileId : Int = 0
    var profileName : String = ""
    var profileType : Int = 0
    var mainMediaId : String = ""
    var isFavourite : Bool = false
    var isOnline : Bool = false
    var distance : String = ""
    
    init() {}
    
    init(profileDic : Dictionary<String, Any>) {
        self.headline = profileDic["headline"] as? String ?? ""
        self.linkStatus = profileDic["linkStatus"] as? Int ?? 0
        self.lastActive = profileDic["lastActive"] as? String ?? ""
        self.age = profileDic["age"] as? Int ?? 0
        self.isTravelling = profileDic["isTravelling"] as? Bool ?? false
        self.profileId = profileDic["profileId"] as? Int ?? 0
        self.profileName = profileDic["profileName"] as? String ?? ""
        self.profileType = profileDic["profileType"] as? Int ?? 0
        self.mainMediaId = profileDic["mainMediaId"] as? String ?? ""
        self.isFavourite = profileDic["isFavourite"] as? Bool ?? false
        self.isOnline = profileDic["isOnline"] as? Bool ?? false
        self.distance = profileDic["distance"] as? String ?? ""
    }
}
