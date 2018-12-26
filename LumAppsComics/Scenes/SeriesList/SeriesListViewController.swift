//
//  SeriesListViewController.swift
//  LumAppsSeries
//
//  Created by Jonathan Arnal on 16/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import UIKit

protocol SeriesListViewInterface: Alertable, ConfigurableViewController, ProvidableViewController where View == SeriesListView {
    func updateActivityIndicator(show: Bool)
    func updateLoadMoreDataStatus(show: Bool)
}

class SeriesListViewController: BaseConfigurableProvidableViewController<SeriesListPresentation, SeriesListView>, SeriesListViewInterface {

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

    // **************************************************************
    // MARK: - Public API
    // **************************************************************

    public func updateActivityIndicator(show: Bool) {
        customView.updateActivityIndicator(show: show)
    }

    public func updateLoadMoreDataStatus(show: Bool) {
        customView.updateLoadMoreDataStatus(show: show)
    }
}
