//
//  API.swift
//  LumAppsComics
//
//  Created by Jonathan Arnal on 19/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import Foundation

protocol API: class {
    var series: SeriesAPIProtocol { get }
//    var comics: ComicsAPIProtocol { get }
}

protocol SeriesAPIProtocol {
    
    @discardableResult func getItems(withOffset offset: Int, then block: @escaping (Result<APIResult<Serie>>) -> Void) -> URLSessionTask?
    @discardableResult func getCharacters(forId id: Int, withOffset offset: Int, then block: @escaping (Result<APIResult<ComicCharacter>>) -> Void) -> URLSessionTask?
    @discardableResult func getComcis(forId id: Int, withOffset offset: Int, then block: @escaping (Result<APIResult<Comic>>) -> Void) -> URLSessionTask?
}

protocol ComicsAPIProtocol {
    @discardableResult func getItems(then block: @escaping (Result<APIResult<Comic>>) -> Void) -> URLSessionTask?
}
