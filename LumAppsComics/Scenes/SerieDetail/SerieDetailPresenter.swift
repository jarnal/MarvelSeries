//
//  SerieDetailPresenter.swift
//  LumAppsComics
//
//  Created by Jonathan Arnal on 19/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import UIKit

class SerieDetailPresenter {
    
    // **************************************************************
    // MARK: - Properties
    // **************************************************************
    
    private weak var view: SerieDetailViewController!
    
    private let provider = SerieDetailProvider()
    
    private let api: API!
    private let serieId: Int!
    
    private var charactersController: SerieCharactersViewController!
    private var comicsController: SerieComicsViewController!
    
    private var charactersContainer: SerieCharactersCell?
    private var comicsContainer: SerieComicsCell?
    
    weak var delegate: SerieDetailSceneDelegate? {
        didSet {
            buildChildViewController()
        }
    }
    
    // **************************************************************
    // MARK: - Init
    // **************************************************************
    
    /// 🏭 Initialization
    ///
    /// - Parameter view: related presenter view
    init(withView view: SerieDetailViewController, andAPIClient api: API, serieId: Int) {
        self.view = view
        self.serieId = serieId
        self.api = api
    }
    
    // **************************************************************
    // MARK: - Child View Controllers
    // **************************************************************
    
    /// 🏭 Build all child view controllers
    private func buildChildViewController() {
        
        buildCharactersViewController()
        buildComicsViewController()
    }
    
    /// 🏭 Build characters child view controller
    private func buildCharactersViewController() {
        
        self.charactersController = SerieCharactersViewController()
        let charactersPresenter = SerieCharactersPresenter(withView: charactersController, andAPIClient: api, serieId: serieId)
        charactersPresenter.delegate = self.delegate
        charactersPresenter.parentPresenter = self
        charactersController.presenter = charactersPresenter
    }
    
    /// Build comics child view controller
    private func buildComicsViewController() {
        
        self.comicsController = SerieComicsViewController()
        let comicsPresenter = SerieComicsPresenter(withView: comicsController, andAPIClient: api, serieId: serieId)
        comicsPresenter.parentPresenter = self
        comicsPresenter.delegate = self.delegate
        comicsController.presenter = comicsPresenter
    }
    
}

extension SerieDetailPresenter: SerieDetailPresentation {
    
    /// 👂 Handles when the container of characters view controller has been built in tableView
    ///
    /// - Parameter cell: container cell
    func didBuildCharactersContainerCell(_ cell: SerieCharactersCell) {
        
        // If character containers is set, characters controller is already built and running
        guard charactersContainer ==  nil else { return }
        
        charactersContainer = cell
        view.add(charactersController, into: cell.collectionContainerView)
    }
    
    /// 👂 Handles when the container of comics view controller has been built in tableView
    ///
    /// - Parameter cell: container cell
    func didBuildComicsContainerCell(_ cell: SerieComicsCell) {
        
        // If character containers is set, comics controller is already built and running
        guard comicsContainer ==  nil else { return }
        
        comicsContainer = cell
        view.add(comicsController, into: cell.collectionContainerView)
    }
    
    /// 👂 Handles when the comics collection content size has been update
    /// This allow to animate tableview to reflect the new comics collection view size
    ///
    /// - Parameter size: new size
    func didUpdateComicsCollectionSize(to size: CGSize) {
        
        DispatchQueue.main.async {
            self.view.reloadData(animated: true)
        }
    }
    
    /// 👂 Handles when view has been loaded
    func onViewDidLoad() {
        
        provider.delegate = self
        view.setProvider(provider)
        view.reloadData(animated: false)
    }
}
