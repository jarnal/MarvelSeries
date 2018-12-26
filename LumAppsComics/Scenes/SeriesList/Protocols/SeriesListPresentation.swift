//
//  SeriesListPresentation.swift
//  LumAppsComics
//
//  Created by Jonathan Arnal on 19/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import Foundation

protocol SeriesListPresentation: LifeCycleDelegate {
    
    func didStartScrolling()
    func didScrollToBottom()
    func didEndScrolling()
    func didSelectSerie(_ serie: Serie)
}
