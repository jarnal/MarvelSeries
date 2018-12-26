//
//  DateElement.swift
//  LumAppsComics
//
//  Created by Jonathan Arnal on 17/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import Foundation

class DateElement: Codable {
    
    let type: String?
    let date: String?
    
    enum CodingKeys: String, CodingKey {
        case type = "type"
        case date = "date"
    }
    
    init(type: String?, date: String?) {
        self.type = type
        self.date = date
    }
}
