//
//  UIViewControllerExtensions.swift
//  LumAppsComics
//
//  Created by Jonathan Arnal on 18/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func add(_ child: UIViewController, into subview: UIView) {
        
        child.view.translatesAutoresizingMaskIntoConstraints = false
        
        addChild(child)
        subview.addSubview(child.view)
        
        child.view.leadingAnchor.constraint(equalTo: subview.leadingAnchor).isActive = true
        child.view.trailingAnchor.constraint(equalTo: subview.trailingAnchor).isActive = true
        child.view.topAnchor.constraint(equalTo: subview.topAnchor).isActive = true
        child.view.bottomAnchor.constraint(equalTo: subview.bottomAnchor).isActive = true
        
        child.didMove(toParent: self)
    }
    
    func add(_ child: UIViewController) {
        add(child, into: self.view)
    }
    
    func remove() {
        
        guard parent != nil else { return }
        
        willMove(toParent: nil)
        removeFromParent()
        view.removeFromSuperview()
    }
}
