//
//  BaseConfigurableProvidableViewController.swift
//  LumAppsComics
//
//  Created by Jonathan Arnal on 19/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import UIKit

typealias ConfigurableProvidableViewController = UIViewController & ConfigurableViewController & ProvidableViewController
typealias LoadableProvidableView = UIView & ProvidableView & NibLoadable

class BaseConfigurableProvidableViewController<PresenterType, ViewType: LoadableProvidableView>: ConfigurableProvidableViewController {
    
    // **************************************************************
    // MARK: - ConfigurableViewController & ProvidableViewController
    // **************************************************************
    
    typealias Presenter = PresenterType
    typealias View = ViewType
    
    internal var presenter: PresenterType!
    
    internal lazy var customView: ViewType = {
        return _customView
    }()
    
    // **************************************************************
    // MARK: - Life Cycle
    // **************************************************************
    
    override func loadView() {
        view = customView
    }
    
    func setProvider(_ provider: ViewType.Provider) {
        customView.setProvider(provider)
    }
}
