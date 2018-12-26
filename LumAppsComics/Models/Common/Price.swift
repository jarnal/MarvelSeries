//
//  Price.swift
//  LumAppsComics
//
//  Created by Jonathan Arnal on 17/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import Foundation

class Price: Codable {
    
    let type: String?
    let price: Double?
    
    enum CodingKeys: String, CodingKey {
        case type = "type"
        case price = "price"
    }
    
    init(type: String?, price: Double?) {
        self.type = type
        self.price = price
    }
}
