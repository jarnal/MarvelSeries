//
//  SerieDetailPresentation.swift
//  LumAppsComics
//
//  Created by Jonathan Arnal on 19/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import UIKit

protocol SerieDetailPresentation: LifeCycleDelegate {
    
    func didBuildCharactersContainerCell(_ cell: SerieCharactersCell)
    func didBuildComicsContainerCell(_ cell: SerieComicsCell)
    func didUpdateComicsCollectionSize(to size: CGSize)
}
