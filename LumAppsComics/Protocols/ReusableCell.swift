//
//  ReusableCell.swift
//  LumAppsComics
//
//  Created by Jonathan Arnal on 16/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import UIKit

protocol ReusableCell: NibLoadable {
    static var identifier: String { get }
}
extension ReusableCell {
    
    static var identifier: String {
        return String(describing: self)
    }
}
