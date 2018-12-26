//
//  Serie.swift
//  LumAppsComics
//
//  Created by Jonathan Arnal on 17/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import Foundation

class Serie: Codable {
    
    let id: Int?
    let title: String?
    let description: String?
    let resourceURI: String?
    let urls: [URLElement]?
    let startYear: Int?
    let endYear: Int?
    let rating: String?
    let modified: String?
    let thumbnail: Thumbnail?
    let comics: Comics?
    let stories: Stories?
    let events: Events?
    let characters: Characters?
    let creators: Creators?
    let next: Resource?
    let previous: Resource?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case description = "description"
        case resourceURI = "resourceURI"
        case urls = "urls"
        case startYear = "startYear"
        case endYear = "endYear"
        case rating = "rating"
        case modified = "modified"
        case thumbnail = "thumbnail"
        case comics = "comics"
        case stories = "stories"
        case events = "events"
        case characters = "characters"
        case creators = "creators"
        case next = "next"
        case previous = "previous"
    }
    
    init(id: Int?, title: String?, description: String?, resourceURI: String?, urls: [URLElement]?, startYear: Int?, endYear: Int?, rating: String?, modified: String?, thumbnail: Thumbnail?, comics: Comics?, stories: Stories?, events: Events?, characters: Characters?, creators: Creators?, next: Resource?, previous: Resource?) {
        self.id = id
        self.title = title
        self.description = description
        self.resourceURI = resourceURI
        self.urls = urls
        self.startYear = startYear
        self.endYear = endYear
        self.rating = rating
        self.modified = modified
        self.thumbnail = thumbnail
        self.comics = comics
        self.stories = stories
        self.events = events
        self.characters = characters
        self.creators = creators
        self.next = next
        self.previous = previous
    }
}
