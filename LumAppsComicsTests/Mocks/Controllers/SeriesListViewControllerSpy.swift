//
//  SeriesListViewControllerSpy.swift
//  LumAppsComicsTests
//
//  Created by Jonathan Arnal on 26/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import UIKit
@testable import LumAppsComics

class SeriesListViewControllerSpy: FakeBaseViewController<SeriesListPresentation, SeriesListView>, SeriesListViewInterface {
    
    override func setPresenter(_ presenter: SeriesListPresentation){
        print("setPresenter")
    }
    
    override func setProvider(_ provider: SeriesListProvider) {
        print("setProvider")
    }
    
    override func reloadData(animated: Bool) {
        didReloadData = true
    }
    
    var isShowingActivityIndicator: Bool = false
    
    
    func updateActivityIndicator(show: Bool) {
        isShowingActivityIndicator = show
    }
    
    func updateLoadMoreDataStatus(show: Bool) {
        
    }
}
