//
//  Character.swift
//  LumAppsComics
//
//  Created by Jonathan Arnal on 18/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import Foundation

class ComicCharacter: Codable {
    
    let id: Int?
    let name: String?
    let description: String?
    let modified: String?
    let resourceURI: String?
    let urls: [URLElement]?
    let thumbnail: Thumbnail?
    let comics: Comics?
    let stories: Stories?
    let events: Events?
    let series: Series?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case description = "description"
        case modified = "modified"
        case resourceURI = "resourceURI"
        case urls = "urls"
        case thumbnail = "thumbnail"
        case comics = "comics"
        case stories = "stories"
        case events = "events"
        case series = "series"
    }
    
    init(id: Int?, name: String?, description: String?, modified: String?, resourceURI: String?, urls: [URLElement]?, thumbnail: Thumbnail?, comics: Comics?, stories: Stories?, events: Events?, series: Series?) {
        self.id = id
        self.name = name
        self.description = description
        self.modified = modified
        self.resourceURI = resourceURI
        self.urls = urls
        self.thumbnail = thumbnail
        self.comics = comics
        self.stories = stories
        self.events = events
        self.series = series
    }
}
