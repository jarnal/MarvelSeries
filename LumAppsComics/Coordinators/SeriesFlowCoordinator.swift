//
//  ComicsFlowCoordinator.swift
//  LumAppsComics
//
//  Created by Jonathan Arnal on 17/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import UIKit

protocol ComicsListSceneDelegate: class {
    func didSelectComic(_ comic: Comic)
}

protocol SeriesListSceneDelegate: class {
    func didSelectSerie(_ serie: Serie)
}

protocol SerieDetailSceneDelegate: class {
    func didSelectCharacter(_ character: ComicCharacter)
    func didSelectComic(_ comic: Comic)
}

class SeriesFlowCoordinator: Coordinator {
    
    // **************************************************************
    // MARK: - Properties
    // **************************************************************
    
    var childCoordinators: [Coordinator] = []
    
    let navigationController: UINavigationController
    let api: API
    
    // **************************************************************
    // MARK: - Init
    // **************************************************************
    
    init(navigationController: UINavigationController, api: API) {
        self.navigationController = navigationController
        self.api = api
    }
    
    // **************************************************************
    // MARK: - Public API
    // **************************************************************
    
    func start() {
        showSeriesListScene()
    }
    
    // **************************************************************
    // MARK: - Flow
    // **************************************************************
    
    /// Show screen containing all series
    private func showSeriesListScene() {
        
        let controller = SeriesListViewController()
        let presenter = SeriesListPresenter<SeriesListViewController>(withView: controller, andAPIClient: api)
        controller.presenter = presenter
        presenter.delegate = self
        
        navigationController.pushViewController(controller, animated: true)
    }
    
    /// Show screen containing a specific serie
    private func showSerieScene(_ serie: Serie) {
        
        guard let serieId = serie.id else { return }
        
        let controller = SerieDetailViewController()
        let presenter = SerieDetailPresenter(withView: controller, andAPIClient: api, serieId: serieId)
        presenter.delegate = self
        controller.presenter = presenter
        
        navigationController.pushViewController(controller, animated: true)
    }
    
}

extension SeriesFlowCoordinator: SeriesListSceneDelegate {
    
    /// 👂 Handles when a serie has been selected
    ///
    /// - Parameter serie: selected serie
    func didSelectSerie(_ serie: Serie) {
        showSerieScene(serie)
    }
}

extension SeriesFlowCoordinator: SerieDetailSceneDelegate {
    
    /// 👂 Handles when a character has been selected
    ///
    /// - Parameter character: selected character
    func didSelectCharacter(_ character: ComicCharacter) {
        // =>
    }
    
    /// 👂 Handles when a comic has been selected
    ///
    /// - Parameter comic: selected comic
    func didSelectComic(_ comic: Comic) {
        // =>
    }
    
}
