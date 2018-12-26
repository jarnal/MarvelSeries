//
//  CreatorsItem.swift
//  LumAppsComics
//
//  Created by Jonathan Arnal on 17/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import Foundation

class CreatorsItem: Codable {
    
    let resourceURI: String?
    let name: String?
    let role: String?
    
    enum CodingKeys: String, CodingKey {
        case resourceURI = "resourceURI"
        case name = "name"
        case role = "role"
    }
    
    init(resourceURI: String?, name: String?, role: String?) {
        self.resourceURI = resourceURI
        self.name = name
        self.role = role
    }
}
