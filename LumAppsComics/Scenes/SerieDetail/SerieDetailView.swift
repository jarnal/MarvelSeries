//
//  SerieDetailView.swift
//  LumAppsComics
//
//  Created by Jonathan Arnal on 19/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import UIKit

class SerieDetailView: UIView, NibLoadable, ProvidableView {
    
    // **************************************************************
    // MARK: - Properties
    // **************************************************************
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.register(SerieCharactersCell.nib, forCellReuseIdentifier: SerieCharactersCell.identifier)
            tableView.register(SerieComicsCell.nib, forCellReuseIdentifier: SerieComicsCell.identifier)
            tableView.rowHeight = UITableView.automaticDimension
            tableView.estimatedRowHeight = 200
        }
    }
    
    // **************************************************************
    // MARK: - Public API
    // **************************************************************
    
    /// Set provider to tableView (datasource and delegate)
    ///
    /// - Parameter provider: provider
    public func setProvider(_ provider: SerieDetailProvider) {
        tableView.dataSource = provider
        tableView.delegate = provider
    }
    
    /// Reload tableView
    ///
    /// - Parameter animating: should animate reload
    public func reloadData(animated: Bool) {
        if animated == false {
            tableView.reloadData()
        } else {
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
}
