//
//  FakeBaseViewController.swift
//  LumAppsComicsTests
//
//  Created by Jonathan Arnal on 26/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import UIKit
@testable import LumAppsComics

class FakeBaseViewController<PresenterType, ViewType: LoadableProvidableView>: ConfigurableProvidableViewController {
    
    // **************************************************************
    // MARK: - ConfigurableViewController & ProvidableViewController
    // **************************************************************
    
    typealias Presenter = PresenterType
    typealias View = ViewType
    
    internal var presenter: PresenterType!
    
    internal lazy var customView: ViewType = {
        return _customView
    }()
    
    var didReloadData = false
    var didShowAlert = false
    
    // **************************************************************
    // MARK: - Life Cycle
    // **************************************************************
    
    override func loadView() {
        view = customView
    }
    
    func setProvider(_ provider: ViewType.Provider) {
        print("didSetProvider")
    }
    
    func setPresenter(_ presenter: SeriesListPresentation){
        print("didSetPresenter")
    }
    
    func reloadData(animated: Bool) {
        didReloadData = true
    }
    
    func alert(withError error: Error?) {
        didShowAlert = true
    }
    
    func alert(withMessage message: String?) {
        didShowAlert = true
    }
}
