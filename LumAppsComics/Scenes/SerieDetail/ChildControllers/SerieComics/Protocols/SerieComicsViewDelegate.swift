//
//  SerieComicsViewDelegate.swift
//  LumAppsComics
//
//  Created by Jonathan Arnal on 19/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import UIKit

protocol SerieComicsViewDelegate: class {
    func didUpdateContentSize(to size: CGSize)
}
