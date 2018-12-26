//
//  TextObject.swift
//  LumAppsComics
//
//  Created by Jonathan Arnal on 17/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import Foundation

class TextObject: Codable {
    
    let type: String?
    let language: String?
    let text: String?
    
    enum CodingKeys: String, CodingKey {
        case type = "type"
        case language = "language"
        case text = "text"
    }
    
    init(type: String?, language: String?, text: String?) {
        self.type = type
        self.language = language
        self.text = text
    }
}
