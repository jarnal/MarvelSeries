//
//  SerieCharacterFlowLayout.swift
//  LumAppsComics
//
//  Created by Jonathan Arnal on 18/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import UIKit

class SerieCharacterFlowLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
        super.prepare()
        
        self.itemSize = CGSize(width: 150, height: 180)
        self.scrollDirection = .horizontal
    }
    
}
