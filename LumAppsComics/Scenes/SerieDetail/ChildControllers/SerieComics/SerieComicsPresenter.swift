//
//  SerieComicsListPresenter.swift
//  LumAppsSerieComics
//
//  Created by Jonathan Arnal on 17/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import UIKit

class SerieComicsPresenter {
    
    // **************************************************************
    // MARK: - Properties
    // **************************************************************
    
    weak var delegate: SerieDetailSceneDelegate?
    
    weak var parentPresenter: SerieDetailPresentation?
    
    private weak var view: SerieComicsViewController!
    
    private let api: API!
    private let serieID: Int!
    
    private let provider = SerieComicsProvider()
    
    // **************************************************************
    // MARK: - Init
    // **************************************************************
    
    /// 🏭 Initialization
    ///
    /// - Parameter view: related presenter view
    init(withView view: SerieComicsViewController, andAPIClient api: API, serieId: Int) {
        self.view = view
        self.serieID = serieId
        self.api = api
    }
    
    // **************************************************************
    // MARK: - Data
    // **************************************************************
    
    /// ⬇️ Fetch related serie comics from server
    private func fetchComics() {
        
        view.updateActivityIndicator(show: true)
        api.series.getComcis(forId: serieID, withOffset: 0, then: {[weak self] (result) in
            switch result {
            case .valid(let apiResult):
                if let comics = apiResult?.data?.results {
                    DispatchQueue.main.async {
                        self?.handleComics(comics)
                    }
                }
            case .error(let error):
                self?.view.alert(withError: error)
            }
        })
    }
    
    /// 🎯 Handles when comics have been retrieved from server
    ///
    /// - Parameter comics: comics retrieved
    private func handleComics(_ comics: [Comic]) {
        
        provider.comics.append(contentsOf: comics)
        view.reloadData(animated: true)
        view.updateActivityIndicator(show: false)
        view.updateEmptyStateVisibility(hidden: comics.isEmpty == false)
    }
    
}

extension SerieComicsPresenter: SerieComicsPresentation {
    
    /// 👂 Handles when collection view size has been updated
    ///
    /// - Parameter size: new size
    public func didUpdateCollectionSize(to size: CGSize) {
        parentPresenter?.didUpdateComicsCollectionSize(to: size)
    }
    
    /// 👂 Handles when the view has been loaded
    func onViewDidLoad() {
        fetchComics()
        
        provider.delegate = self
        view.setProvider(provider)
        view.reloadData(animated: false)
    }
}
