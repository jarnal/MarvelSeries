//
//  SerieComicsListProvider.swift
//  LumAppsSerieComics
//
//  Created by Jonathan Arnal on 17/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import UIKit

class SerieComicsProvider: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var comics: [Comic] = []
    
    weak var delegate: SerieComicsPresentation?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return comics.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ComicsCell.identifier, for: indexPath) as! ComicsCell
        let comic = comics[indexPath.row]
        let model = SerieComicsCellViewModel(title: comic.title, thumbnailURL: comic.thumbnail?.url)
        cell.configure(withModel: model)
        return cell
    }
}
