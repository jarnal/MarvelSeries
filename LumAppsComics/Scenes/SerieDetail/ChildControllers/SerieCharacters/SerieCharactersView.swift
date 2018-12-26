//
//  SerieCharactersListView.swift
//  LumAppsSerieCharacters
//
//  Created by Jonathan Arnal on 17/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import UIKit

class SerieCharactersView: UIView, NibLoadable, ProvidableView, ActivityShower {
    
    // **************************************************************
    // MARK: - Properties
    // **************************************************************
    
    @IBOutlet private weak var collectionView: UICollectionView! {
        didSet {
            collectionView.register(reusableCell: CharactersCell.self)
        }
    }
    
    @IBOutlet internal weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var emptyStateLabel: UILabel! {
        didSet {
            emptyStateLabel.isHidden = true
        }
    }
    
    
    // **************************************************************
    // MARK: - Public API
    // **************************************************************
    
    public func setProvider(_ provider: SerieCharactersProvider) {
        collectionView.dataSource = provider
        collectionView.delegate = provider
    }
    
    public func reloadData(animated: Bool) {
        collectionView.reloadData()
    }
    
    public func updateEmptyStateVisibility(hidden: Bool) {
        emptyStateLabel.isHidden = hidden
    }
}
