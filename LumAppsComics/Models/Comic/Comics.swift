//
//  Comics.swift
//  LumAppsComics
//
//  Created by Jonathan Arnal on 17/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import Foundation

class Comics: Codable {
    
    let available: Int?
    let returned: Int?
    let collectionURI: String?
    let items: [ComicItem]?
    
    enum CodingKeys: String, CodingKey {
        case available = "available"
        case returned = "returned"
        case collectionURI = "collectionURI"
        case items = "items"
    }
    
    init(available: Int?, returned: Int?, collectionURI: String?, items: [ComicItem]?) {
        self.available = available
        self.returned = returned
        self.collectionURI = collectionURI
        self.items = items
    }
}
