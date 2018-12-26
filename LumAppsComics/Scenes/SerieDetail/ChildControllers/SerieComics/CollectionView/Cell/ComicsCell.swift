//
//  SerieCell.swift
//  LumAppsSerieComics
//
//  Created by Jonathan Arnal on 17/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import UIKit
import Kingfisher

class ComicsCell: UICollectionViewCell, ConfigurableCell {
    
    @IBOutlet weak var comicNameLabel: UILabel!
    @IBOutlet weak var comicImageView: UIImageView! {
        didSet {
            comicImageView.layer.cornerRadius = 6
            comicImageView.clipsToBounds = true
        }
    }
    
    typealias Model = SerieComicsCellViewModel
    
    func configure(withModel model: SerieComicsCellViewModel) {
        
        comicNameLabel.text = model.title
        if let url = model.thumbnailURL {
            comicImageView.kf.setImage(with: url)
        }
    }
    
}
