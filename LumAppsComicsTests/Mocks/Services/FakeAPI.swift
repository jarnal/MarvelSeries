//
//  FakeAPI.swift
//  LumAppsComicsTests
//
//  Created by Jonathan Arnal on 20/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import Foundation
@testable import LumAppsComics

class FakeAPI: API {
    
    var _series = FakeSeriesAPI()
    
    var series: SeriesAPIProtocol {
        return _series
    }
    
}
