//
//  SerieDetailViewController.swift
//  LumAppsComics
//
//  Created by Jonathan Arnal on 18/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import UIKit

class SerieDetailViewController: BaseConfigurableProvidableViewController<SerieDetailPresentation, SerieDetailView> {
    
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
    
}
