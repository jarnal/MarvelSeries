//
//  ProvidableViewController.swift
//  LumAppsComics
//
//  Created by Jonathan Arnal on 19/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import UIKit

protocol ProvidableViewController: class {
    
    associatedtype View: UIView & ProvidableView & NibLoadable
    
    // Should be impletemented as lazy
    var customView: View { get }
    
    // Contains the default implementation
    var _customView: View { get }
    
    func setProvider(_ provider: View.Provider)
    func reloadData(animated: Bool)
}
extension ProvidableViewController where View: UIView {
    
    var _customView: View {
        let view = View.instanceFromNib
        return view
    }
    
    func setProvider(_ provider: View.Provider) {
        customView.setProvider(provider)
    }
    
    func reloadData(animated: Bool) {
        customView.reloadData(animated: animated)
    }
}
