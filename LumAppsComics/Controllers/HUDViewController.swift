//
//  LoadingFullScreenViewController.swift
//  LumAppsComics
//
//  Created by Jonathan Arnal on 19/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import UIKit

class HUDViewController: UIViewController, Windowable {
    
    var window: UIWindow?
    var duration: Double {
        return 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        
        self.view.backgroundColor = UIColor.white.withAlphaComponent(0.9)
        
        let indicator = UIActivityIndicatorView(style: .gray)
        indicator.hidesWhenStopped = true
        indicator.startAnimating()
        
        let label = UILabel()
        label.text = "Loading more data"
        label.textAlignment = .center
        
        let containerView = UIView()
        
        containerView.addSubview(indicator)
        containerView.addSubview(label)
        
        view.addSubview(containerView)
        
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8).isActive = true
        indicator.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0).isActive = true

        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: indicator.bottomAnchor, constant: 8).isActive = true
        label.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 8).isActive = true
        label.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -8).isActive = true
        label.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8).isActive = true
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
    }
    
}
