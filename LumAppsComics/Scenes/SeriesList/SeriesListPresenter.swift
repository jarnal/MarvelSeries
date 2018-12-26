//
//  SeriesListPresenter.swift
//  LumAppsSeries
//
//  Created by Jonathan Arnal on 17/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import UIKit

class SeriesListPresenter<T: SeriesListViewInterface> {
    
    // **************************************************************
    // MARK: - Properties
    // **************************************************************
    
    weak var delegate: SeriesListSceneDelegate?
    
    private let view: T!
    private let api: API!
    
    private let provider = SeriesListProvider()
    
    private var canLoad: Bool = true
    private var loading: Bool = false
    private var dataOffset: Int = 0
    
    private let offsetStep = 20
    
    // **************************************************************
    // MARK: - Init
    // **************************************************************
    
    /// 🏭 Initialization
    ///
    /// - Parameter view: related presenter view
    init(withView view: T, andAPIClient api: API) {
        self.view = view
        self.api = api
    }
    
    // **************************************************************
    // MARK: - Data
    // **************************************************************
    
    /// ⬇️ Fetch all comics from server
    private func fetchSeries(withOffset offset: Int = 0, then block: (() -> Void)? = nil) {
        
        loading = true
        api.series.getItems(withOffset: offset, then: {[weak self] (result) in
            
            guard let `self` = self else { return }
            switch result {
            case .valid(let apiResult):
                if let comics = apiResult?.data?.results {
                    DispatchQueue.main.async {
                        self.handleSeries(comics)
                    }
                }
            case .error(let error):
                self.view.alert(withError: error)
            }
            block?()
        })
    }
    
    /// 🎯 Handles when comics have been retrieved from server
    ///
    /// - Parameter comics: comics retrieved
    private func handleSeries(_ comics: [Serie]) {
        loading = false
        
        provider.comics.append(contentsOf: comics)
        view.reloadData(animated: false)
        view.updateActivityIndicator(show: false)
    }
    
}

extension SeriesListPresenter: SeriesListPresentation {
    
    /// 👂 Handles when scrolling has started
    func didStartScrolling() {
        canLoad = true
    }
    
    /// 👂 Handles when scrolling is happening
    func didScrollToBottom() {
        
        guard loading == false, canLoad == true else { return }
        
        dataOffset = dataOffset.advanced(by: offsetStep)
        
        view.updateLoadMoreDataStatus(show: true)
        fetchSeries(withOffset: dataOffset) { [weak self] in
            DispatchQueue.main.async {
                self?.view.updateLoadMoreDataStatus(show: false)
            }
        }
    }
    
    /// 👂 Handles when scrolling has finished (decelerating)
    func didEndScrolling() {
        canLoad = false
    }
    
    /// 👂 Handles when a serie has been selected
    func didSelectSerie(_ serie: Serie) {
        delegate?.didSelectSerie(serie)
    }
    
    /// 👂 Handles when view has been loaded
    func onViewDidLoad() {
        
        view.updateActivityIndicator(show: true)
        fetchSeries()
        
        provider.delegate = self
        view.setProvider(provider)
        view.reloadData(animated: false)
    }
    
}
