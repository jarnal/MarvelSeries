//
//  CustomCollectionView.swift
//  LumAppsComics
//
//  Created by Jonathan Arnal on 19/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import UIKit

class CustomCollectionView: UICollectionView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if bounds.size != self.intrinsicContentSize {
            self.invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        let height = max(collectionViewLayout.collectionViewContentSize.height, 200)
        let size = CGSize(width: collectionViewLayout.collectionViewContentSize.width, height: height)
        return size
    }
    
}
