//
//  FakeSeriesAPI.swift
//  LumAppsComicsTests
//
//  Created by Jonathan Arnal on 20/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import Foundation
@testable import LumAppsComics

class FakeSeriesAPI: SeriesAPIProtocol {
    
    // **************************************************************
    // MARK: - Mocked Data
    // **************************************************************
    
    // Fake series mocked data
    var fakeSeries: APIResult<Serie> {
        
        let url = Bundle(for: FakeSeriesAPI.self).url(forResource: "getSeries", withExtension: "json")!
        let jsonData = try! Data(contentsOf: url)
        let result = try! JSONDecoder().decode(APIResult<Serie>.self, from: jsonData)
        
        return result
    }
    
    // Fake characters mocked data
    var fakeCharacters: APIResult<ComicCharacter> {
        
        let url = Bundle.main.url(forResource: "getSerieCharacters", withExtension: "json")!
        let jsonData = try! Data(contentsOf: url)
        let result = try! JSONDecoder().decode(APIResult<ComicCharacter>.self, from: jsonData)
        
        return result
    }
    
    // Fake comics mocked data
    var fakeComics: APIResult<Comic> {
        
        let url = Bundle.main.url(forResource: "getSerieComics", withExtension: "json")!
        let jsonData = try! Data(contentsOf: url)
        let result = try! JSONDecoder().decode(APIResult<Comic>.self, from: jsonData)
        
        return result
    }
    
    var getItemsSpyClosure: (() -> Void)!
    var getCharactersSpyClosure: (() -> Void)!
    var getComicsSpyClosure: (() -> Void)!
    
    public var shouldFailNextCall: Bool = false
    
    // **************************************************************
    // MARK: - APIs
    // **************************************************************
    
    /// ⬇️ Load items from server
    ///
    /// - Parameter block: completion block to call once the data has been retrieved
    /// - Returns: task (allowing to cancel it)
    @discardableResult public func getItems(withOffset offset: Int, then block: @escaping (Result<APIResult<Serie>>) -> Void) -> URLSessionTask? {
        
        block(shouldFailNextCall ? .error(CustomError.noJsonInResponse) : .valid(fakeSeries))
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.getItemsSpyClosure()
        })
        return URLSessionTask()
    }
    
    /// ⬇️ Get all characters related to a specific serie
    ///
    /// - Parameters:
    ///   - id: related serie id
    ///   - offset: offset of the data
    ///   - block: completion block to call once the data has been retrieved
    /// - Returns: task (allowing to cancel it)
    @discardableResult public func getCharacters(forId id: Int, withOffset offset: Int, then block: @escaping (Result<APIResult<ComicCharacter>>) -> Void) -> URLSessionTask? {
        
        block(.valid(fakeCharacters))
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.getCharactersSpyClosure()
        })
        return URLSessionTask()
    }
    
    /// ⬇️ Get all comics related to a specific serie
    ///
    /// - Parameters:
    ///   - id: related serie id
    ///   - offset: offset of the data
    ///   - block: completion block to call once the data has been retrieved
    /// - Returns: task (allowing to cancel it)
    @discardableResult public func getComcis(forId id: Int, withOffset offset: Int, then block: @escaping (Result<APIResult<Comic>>) -> Void) -> URLSessionTask? {
        
        block(.valid(fakeComics))
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.getComicsSpyClosure()
        })
        return URLSessionTask()
    }
    
}
