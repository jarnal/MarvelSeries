//
//  SerieCell.swift
//  LumAppsSerieCharacters
//
//  Created by Jonathan Arnal on 17/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import UIKit
import Kingfisher

class SerieCharactersCell: UITableViewCell, ConfigurableCell {
    
    @IBOutlet weak var sectionTitleLabel: UILabel!
    @IBOutlet weak var collectionContainerView: UIView!
    
    typealias Model = SerieCharactersCellViewModel
    
    func configure(withModel model: SerieCharactersCellViewModel) {
        
//        comicNameLabel.text = model.title
//        if let url = model.thumbnailURL {
//            comicImageView.kf.setImage(with: url)
//        }
    }
    
}
