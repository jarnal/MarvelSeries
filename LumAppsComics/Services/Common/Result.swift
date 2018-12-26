//
//  AppCoordinator.swift
//  LumAppsComics
//
//  Created by Jonathan Arnal on 17/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import Foundation

enum Result<T> {
    case valid(T?)
    case error(Error)
}
