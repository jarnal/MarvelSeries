//
//  TestRouter.swift
//  JonathanTechnicalTest
//
//  Created by Jonathan Arnal on 22/11/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import Foundation

enum ComicsRouter: APIRequestConvertible {
    
    case getAll([String: Any]?)
    case get(String)
    case getCharacters(String, [String: Any]?)
    case getCreators(String, [String: Any]?)
    case getEvents(String, [String: Any]?)
    
    var route: String {
        return "comics"
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var urlParams: [String : Any]? {
        switch self {
        case .getAll(let parameters):
            return parameters
        case .getCharacters(_, let parameters):
            return parameters
        case .getCreators(_, let parameters):
            return parameters
        case .getEvents(_, let parameters):
            return parameters
        case .get(_):
            return nil
        }
    }
    
    var params: [String : Any]? {
        return nil
    }
    
    var path: String? {
        switch self {
        case .getAll:
            return nil
        case .get(let comicId):
            return "\(comicId)"
        case .getCharacters(let comicId):
            return "\(comicId)/characters"
        case .getCreators(let comicId):
            return "\(comicId)/creators"
        case .getEvents(let comicId):
            return "\(comicId)/events"
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
    
}
