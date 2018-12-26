//
//  SeriesFlowLayout.swift
//  LumAppsComics
//
//  Created by Jonathan Arnal on 19/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import UIKit

class SeriesFlowLayout: UICollectionViewFlowLayout {
    
    var elementsPerLine: CGFloat {
        return 3
    }
    
    override func prepare() {
        super.prepare()
        
        guard let collectionView = self.collectionView else { return }
        
        let spacing = self.minimumInteritemSpacing * (elementsPerLine-1)
        let width = (collectionView.bounds.inset(by: collectionView.layoutMargins).size.width - spacing) / elementsPerLine
        
        let height = width + 30
        self.itemSize = CGSize(width: width, height: height)
        
        self.scrollDirection = .vertical
    }
    
}
