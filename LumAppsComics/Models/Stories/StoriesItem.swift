//
//  StoriesItem.swift
//  LumAppsComics
//
//  Created by Jonathan Arnal on 17/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import Foundation

class StoriesItem: Codable {
    
    let resourceURI: String?
    let name: String?
    let type: String?
    
    enum CodingKeys: String, CodingKey {
        case resourceURI = "resourceURI"
        case name = "name"
        case type = "type"
    }
    
    init(resourceURI: String?, name: String?, type: String?) {
        self.resourceURI = resourceURI
        self.name = name
        self.type = type
    }
}
