//
//  Thumbnail.swift
//  LumAppsComics
//
//  Created by Jonathan Arnal on 17/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import Foundation

class Thumbnail: Codable {
    
    let path: String?
    let thumbnailExtension: String?
    
    var url: URL? {
        guard let path = path, let thumbnailExtension = thumbnailExtension else { return nil }
        return URL(string: path)?.appendingPathComponent("standard_xlarge", isDirectory: false).appendingPathExtension(thumbnailExtension)
    }
    
    enum CodingKeys: String, CodingKey {
        case path = "path"
        case thumbnailExtension = "extension"
    }
    
    init(path: String?, thumbnailExtension: String?) {
        self.path = path
        self.thumbnailExtension = thumbnailExtension
    }
}
