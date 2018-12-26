//
//  AppCoordinator.swift
//  LumAppsComics
//
//  Created by Jonathan Arnal on 16/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    
    // **************************************************************
    // MARK: - Properties
    // **************************************************************
    
    var childCoordinators: [Coordinator] = []
    
    let navigationController: UINavigationController
    let api: API
    
    // **************************************************************
    // MARK: - Init
    // **************************************************************
    
    init(window: UIWindow, withAPI api: API) {
        
        self.navigationController = UINavigationController()
        self.api = api
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    // **************************************************************
    // MARK: - Public API
    // **************************************************************
    
    func start() {
        showComicsFlow()
    }
    
    /// Show comics flow
    func showComicsFlow() {
        
        let comicsCoordinator = SeriesFlowCoordinator(navigationController: navigationController, api: api)
        addChild(comicsCoordinator)
        comicsCoordinator.start()
    }
}
