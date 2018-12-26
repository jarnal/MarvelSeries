//
//  SerieCharactersListPresenter.swift
//  LumAppsSerieCharacters
//
//  Created by Jonathan Arnal on 17/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import UIKit

class SerieCharactersPresenter {
    
    // **************************************************************
    // MARK: - Properties
    // **************************************************************
    
    weak var delegate: SerieDetailSceneDelegate?
    
    weak var parentPresenter: SerieDetailPresentation?
    
    private weak var view: SerieCharactersViewController!
    
    private let api: API!
    private let serieID: Int!
    
    private let provider = SerieCharactersProvider()
    
    // **************************************************************
    // MARK: - Init
    // **************************************************************
    
    /// 🏭 Initialization
    ///
    /// - Parameter view: related presenter view
    init(withView view: SerieCharactersViewController, andAPIClient api: API, serieId: Int) {
        self.view = view
        self.serieID = serieId
        self.api = api
    }
    
    // **************************************************************
    // MARK: - Data
    // **************************************************************
    
    /// Fetch related serie characters from server
    private func fetchCharacters() {
        
        view.updateActivityIndicator(show: true)
        api.series.getCharacters(forId: serieID, withOffset: 0, then: {[weak self] (result) in
            switch result {
            case .valid(let apiResult):
                if let comics = apiResult?.data?.results {
                    DispatchQueue.main.async {
                        self?.handleCharacters(comics)
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
    private func handleCharacters(_ characters: [ComicCharacter]) {
        
        provider.characters.append(contentsOf: characters)
        view.reloadData(animated: false)
        view.updateActivityIndicator(show: false)
        view.updateEmptyStateVisibility(hidden: characters.isEmpty == false)
    }
    
}

extension SerieCharactersPresenter: SerieCharactersPresentation {
    
    // **************************************************************
    // MARK: - Life Cycle Delegate
    // **************************************************************
    
    func onViewDidLoad() {
        fetchCharacters()
        
        provider.delegate = self
        view.setProvider(provider)
        view.reloadData(animated: false)
    }
}
