//
//  SeriesListPresenterTests.swift
//  LumAppsComicsTests
//
//  Created by Jonathan Arnal on 20/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import XCTest
import UIKit
@testable import LumAppsComics

class SeriesListPresenterTests: XCTestCase {
    
    private var presenter: SeriesListPresenter<SeriesListViewControllerSpy>!
    private var controllerSpy: SeriesListViewControllerSpy!
    private var apiSpy: FakeAPI!
    
    override func setUp() {
        self.controllerSpy = SeriesListViewControllerSpy()
        self.apiSpy = FakeAPI()
        self.presenter = SeriesListPresenter<SeriesListViewControllerSpy>(withView: controllerSpy, andAPIClient: apiSpy)
    }
    
    override func tearDown() {}
    
    func test_thatSeriesListPresenter_loadsData() {
        
        let expectation = XCTestExpectation(description: "Get series api has been called")
        apiSpy._series.getItemsSpyClosure = {
            expectation.fulfill()
        }
        
        presenter.onViewDidLoad()
        XCTAssert(controllerSpy.isShowingActivityIndicator, "Should be showing indicator when loading")
    
        wait(for: [expectation], timeout: 3)
        
        XCTAssert(controllerSpy.didReloadData, "Should have reloaded data")
    }
    
    func test_thatSeriesListPresenter_showsError() {
        
        let expectation = XCTestExpectation(description: "Get series api has been called")
        apiSpy._series.getItemsSpyClosure = {
            expectation.fulfill()
        }
        apiSpy._series.shouldFailNextCall = true
        
        presenter.onViewDidLoad()
        XCTAssert(controllerSpy.didShowAlert, "Should be showing an error")
        
        wait(for: [expectation], timeout: 3)
    }
    
}
