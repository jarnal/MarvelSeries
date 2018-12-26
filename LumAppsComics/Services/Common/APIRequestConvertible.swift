//
//  AppCoordinator.swift
//  LumAppsComics
//
//  Created by Jonathan Arnal on 17/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import Foundation

protocol APIRequestConvertible {
    
    var route: String { get }
    var method: HTTPMethod { get }
    var urlParams: [String: Any]? { get }
    var params: [String: Any]? { get }
    var path: String? { get }
    var headers: [String: String]? { get }
}
