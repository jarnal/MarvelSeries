//
//  ActivityShower.swift
//  LumAppsComics
//
//  Created by Jonathan Arnal on 19/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import UIKit

protocol ActivityShower {
    var activityIndicator: UIActivityIndicatorView! { get set }
}
extension ActivityShower where Self: UIView {
    
    func updateActivityIndicator(show: Bool) {
        if show {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
}
