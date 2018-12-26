//
//  SerieCell.swift
//  LumAppsSerieComics
//
//  Created by Jonathan Arnal on 17/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import UIKit
import Kingfisher

class SerieComicsCell: UITableViewCell, ConfigurableCell {
    
    @IBOutlet weak var sectionTitleLabel: UILabel!
    @IBOutlet weak var collectionContainerView: UIView!
    
    typealias Model = SerieComicsCellViewModel
    
    func configure(withModel model: SerieComicsCellViewModel) {}
    
}
