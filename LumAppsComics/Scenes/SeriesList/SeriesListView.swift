//
//  SeriesListView.swift
//  LumAppsSeries
//
//  Created by Jonathan Arnal on 17/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import UIKit

class SeriesListView: UIView, NibLoadable, ProvidableView, ActivityShower {
    
    // **************************************************************
    // MARK: - Properties
    // **************************************************************
    
    @IBOutlet private weak var collectionView: UICollectionView! {
        didSet {
            collectionView.register(reusableCell: SerieCell.self)
        }
    }
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var loadMoreView: UIView!
    @IBOutlet weak var loadMoreViewHeightConstraint: NSLayoutConstraint! {
        didSet {
            loadMoreViewHeightConstraint.constant = 0
        }
    }
    
    // **************************************************************
    // MARK: - Public API
    // **************************************************************
    
    public func updateLoadMoreDataStatus(show: Bool) {
        
        loadMoreViewHeightConstraint.constant = show ? 30 : 0
        UIView.animate(withDuration: 0.4, animations: {
            self.setNeedsLayout()
            self.layoutIfNeeded()
        })
    }
    
    public func setProvider(_ provider: SeriesListProvider) {
        collectionView.dataSource = provider
        collectionView.delegate = provider
    }
    
    public func reloadData(animated: Bool) {
        collectionView.reloadData()
    }
}
