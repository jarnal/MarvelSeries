//
//  ProvidableView.swift
//  LumAppsComics
//
//  Created by Jonathan Arnal on 19/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import UIKit

protocol ProvidableView: class {
    
    associatedtype Provider
    
    func setProvider(_ provider: Provider)
    func reloadData(animated: Bool)
}
