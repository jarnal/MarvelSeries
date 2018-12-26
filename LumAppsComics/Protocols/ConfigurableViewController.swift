//
//  ConfigurableViewController.swift
//  LumAppsComics
//
//  Created by Jonathan Arnal on 16/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import UIKit

protocol ConfigurableViewController: class {
    
    associatedtype Presenter
    
    var presenter: Presenter! {get set}
    func setPresenter(_ presenter: Presenter)
}
extension ConfigurableViewController {
    
    func setPresenter(_ presenter: Presenter) {
        self.presenter = presenter
    }
}
