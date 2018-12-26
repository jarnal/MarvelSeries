//
//  SeriesRouter.swift
//  LumAppsComics
//
//  Created by Jonathan Arnal on 17/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import Foundation

enum SeriesRouter: APIRequestConvertible {
    
    case getAll([String: Any]?)
    case get(Int)
    case getComics(Int, [String: Any]?)
    case getCharacters(Int, [String: Any]?)
    case getCreators(Int, [String: Any]?)
    case getEvents(Int, [String: Any]?)
    
    var route: String {
        return "series"
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
        case .getComics(_, let parameters):
            return parameters
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
        case .getCharacters(let comicId, _):
            return "\(comicId)/characters"
        case .getCreators(let comicId, _):
            return "\(comicId)/creators"
        case .getEvents(let comicId, _):
            return "\(comicId)/events"
        case .getComics(let comicId, _):
            return "\(comicId)/comics"
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
    
}
