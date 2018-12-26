//
//  APIKey.swift
//  LumAppsComics
//
//  Created by Jonathan Arnal on 19/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import Foundation

struct APIKey {
    
    var publicKey: String
    var privateKey: String
    
    func hash(withTimeStampString timestamp: String) -> String {
        guard let md5 = MD5( timestamp + privateKey + publicKey ) else { fatalError("MD5 building failed, check api keys and timestamp") }
        return md5
    }
}
