//
//  SerieCharactersListViewController.swift
//  LumAppsSerieCharacters
//
//  Created by Jonathan Arnal on 16/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import UIKit

class SerieCharactersViewController: BaseConfigurableProvidableViewController<SerieCharactersPresentation, SerieCharactersView>, Alertable {
    
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
