//
//  SerieComicsListView.swift
//  LumAppsSerieComics
//
//  Created by Jonathan Arnal on 17/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import UIKit

class SerieComicsView: UIView, NibLoadable, ProvidableView, ActivityShower {
    
    // **************************************************************
    // MARK: - Properties
    // **************************************************************
    
    @IBOutlet private weak var collectionContainerHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet private weak var collectionView: CustomCollectionView! {
        didSet {
            collectionView.register(reusableCell: ComicsCell.self)
            collectionView.addObserver(self, forKeyPath: "contentSize", options: NSKeyValueObservingOptions.new, context: nil)
        }
    }
    
    @IBOutlet internal weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var emptyStateLabel: UILabel! {
        didSet {
            emptyStateLabel.isHidden = true
        }
    }
    
    weak var delegate: SerieComicsViewDelegate?
    
    // **************************************************************
    // MARK: - Life Cycle
    // **************************************************************
    
    override func didMoveToSuperview() {
        if superview == nil {
            collectionView.removeObserver(self, forKeyPath: "contentSize")
        }
    }
    
    // **************************************************************
    // MARK: - Observers
    // **************************************************************
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {

        collectionView.layer.removeAllAnimations()
        collectionContainerHeightConstraint.constant = collectionView.intrinsicContentSize.height
        
        delegate?.didUpdateContentSize(to: collectionView.intrinsicContentSize)
    }
    
    // **************************************************************
    // MARK: - Public API
    // **************************************************************
    
    public func setProvider(_ provider: SerieComicsProvider) {
        collectionView.dataSource = provider
        collectionView.delegate = provider
    }
    
    func reloadData(animated: Bool) {
        collectionView.reloadData()
    }
    
    public func updateEmptyStateVisibility(hidden: Bool) {
        emptyStateLabel.isHidden = hidden
    }
}
