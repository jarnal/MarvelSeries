//
//  ConfigurableCell.swift
//  LumAppsComics
//
//  Created by Jonathan Arnal on 16/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import UIKit

typealias ReusableTableViewCell = UITableViewCell & NibLoadable & ConfigurableCell & ReusableCell
typealias ReusableCollectionViewCell = UICollectionViewCell & NibLoadable & ConfigurableCell & ReusableCell

protocol ConfigurableCell: ReusableCell {
    
    associatedtype Model
    func configure(withModel model: Model)
}
