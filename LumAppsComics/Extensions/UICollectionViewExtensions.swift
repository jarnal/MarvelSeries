//
//  UICollectionViewExtensions.swift
//  LumAppsComics
//
//  Created by Jonathan Arnal on 17/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func register(reusableCell cellType: ReusableCell.Type) {
        register(cellType.nib, forCellWithReuseIdentifier: cellType.identifier)
    }
}
