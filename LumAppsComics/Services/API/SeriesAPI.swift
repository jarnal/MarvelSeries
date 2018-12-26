//
//  SeriesAPI.swift
//  LumAppsComics
//
//  Created by Jonathan Arnal on 17/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import Foundation

class SeriesAPI: BaseAPI, SeriesAPIProtocol {
    
    /// ⬇️ Load items from server
    ///
    /// - Parameter block: completion block to call once the data has been retrieved
    /// - Returns: task (allowing to cancel it)
    @discardableResult public func getItems(withOffset offset: Int, then block: @escaping (Result<APIResult<Serie>>) -> Void) -> URLSessionTask? {
        
        let router = SeriesRouter.getAll([
            "contains":"comic",
            "offset": offset
        ])
        let request = buildRequest(forRouter: router)
        return sendRequest(request, then: block, attempts: 3)
    }
    
    /// ⬇️ Get all characters related to a specific serie
    ///
    /// - Parameters:
    ///   - id: related serie id
    ///   - offset: offset of the data
    ///   - block: completion block to call once the data has been retrieved
    /// - Returns: task (allowing to cancel it)
    @discardableResult public func getCharacters(forId id: Int, withOffset offset: Int, then block: @escaping (Result<APIResult<ComicCharacter>>) -> Void) -> URLSessionTask? {
        
        let router = SeriesRouter.getCharacters(id, [
            "offset": offset
        ])
        
        let request = buildRequest(forRouter: router)
        return sendRequest(request, then: block, attempts: 3)
    }
    
    /// ⬇️ Get all comics related to a specific serie
    ///
    /// - Parameters:
    ///   - id: related serie id
    ///   - offset: offset of the data
    ///   - block: completion block to call once the data has been retrieved
    /// - Returns: task (allowing to cancel it)
    @discardableResult public func getComcis(forId id: Int, withOffset offset: Int, then block: @escaping (Result<APIResult<Comic>>) -> Void) -> URLSessionTask? {
        
        let router = SeriesRouter.getComics(id, [
            "offset": offset
        ])
        
        let request = buildRequest(forRouter: router)
        return sendRequest(request, then: block, attempts: 3)
    }
    
}
