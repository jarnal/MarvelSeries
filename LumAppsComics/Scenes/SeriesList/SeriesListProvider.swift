//
//  SeriesListProvider.swift
//  LumAppsSeries
//
//  Created by Jonathan Arnal on 17/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import UIKit

protocol CollectionViewProvider: UICollectionViewDataSource, UICollectionViewDelegate {}

class SeriesListProvider: NSObject, CollectionViewProvider {
    
    var comics: [Serie] = []
    
    weak var delegate: SeriesListPresentation?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return comics.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SerieCell.identifier, for: indexPath) as! SerieCell
        let comic = comics[indexPath.row]
        let model = SerieCellViewModel(title: comic.title, thumbnailURL: comic.thumbnail?.url)
        cell.configure(withModel: model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let comic = comics[indexPath.row]
        delegate?.didSelectSerie(comic)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        // Here we detect if the table has reached the bottom of the content to inform delegate
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        if offsetY > contentHeight - scrollView.frame.size.height {
            delegate?.didScrollToBottom()
        }
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        delegate?.didStartScrolling()
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        delegate?.didEndScrolling()
    }
}
