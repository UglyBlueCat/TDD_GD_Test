//
//  AuthBundle.swift
//  TDD GD Test
//
//  Created by Robin Spinks on 03/05/2017.
//  Copyright © 2017 Robin Spinks. All rights reserved.
//

import Foundation

class AuthBundle {
    var access_token : String = ""
    var token_type : String = ""
    var expires_in : Int = 0
    
    init() {}
    
    init(authDic : Dictionary<String, Any>) {
        self.access_token = authDic["access_token"] as? String ?? ""
        self.token_type = authDic["token_type"] as? String ?? ""
        self.expires_in = authDic["expires_in"] as? Int ?? 0
    }
}
