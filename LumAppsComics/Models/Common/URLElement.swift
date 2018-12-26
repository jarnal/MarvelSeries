//
//  URLElement.swift
//  LumAppsComics
//
//  Created by Jonathan Arnal on 17/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import Foundation

class URLElement: Codable {
    
    let type: String?
    let url: String?
    
    enum CodingKeys: String, CodingKey {
        case type = "type"
        case url = "url"
    }
    
    init(type: String?, url: String?) {
        self.type = type
        self.url = url
    }
}
