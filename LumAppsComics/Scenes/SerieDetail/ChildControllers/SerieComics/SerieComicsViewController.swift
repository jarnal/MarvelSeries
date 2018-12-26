//
//  SerieComicsListViewController.swift
//  LumAppsSerieComics
//
//  Created by Jonathan Arnal on 16/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import UIKit

class SerieComicsViewController: BaseConfigurableProvidableViewController<SerieComicsPresenter, SerieComicsView>, Alertable {
    
    // **************************************************************
    // MARK: - Properties
    // **************************************************************
    
    // Properties goes here
    
    // **************************************************************
    // MARK: - Life Cycle
    // **************************************************************
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.onViewDidLoad()
        customView.delegate = self
    }
    
    // **************************************************************
    // MARK: - Public API
    // **************************************************************
    
    public func updateActivityIndicator(show: Bool) {
        customView.updateActivityIndicator(show: show)
    }
    
    public func updateEmptyStateVisibility(hidden: Bool) {
        customView.updateEmptyStateVisibility(hidden: hidden)
    }
    
}

extension SerieComicsViewController: SerieComicsViewDelegate {
    
    /// Handles when collection size has been updated
    ///
    /// - Parameter size: new size
    func didUpdateContentSize(to size: CGSize) {
        presenter.didUpdateCollectionSize(to: size)
    }
}
