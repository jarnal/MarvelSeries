//
//  NibLoadable.swift
//  LumAppsComics
//
//  Created by Jonathan Arnal on 16/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import UIKit

public protocol NibLoadable: class {}

extension NibLoadable {
    
    /// Nib name of the UIView
    static var nibName: String {
        return String(describing: self)
    }
    
    /// Nib instance
    static var nib: UINib {
        return UINib(nibName: Self.nibName, bundle: nil)
    }
}

extension NibLoadable where Self: UIView {
    
    /// Returns an instance of the view
    static var instanceFromNib: Self {
        return nib.instantiate(withOwner: self, options: nil).first as! Self
    }
    
    /// Load nib and add it into view
    public func loadView() {
        
        let nib = Self.instanceFromNib
        nib.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(nib)
        
        nib.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        nib.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        nib.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        nib.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}
