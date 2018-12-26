//
//  SerieCharactersListProvider.swift
//  LumAppsSerieCharacters
//
//  Created by Jonathan Arnal on 17/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import UIKit

class SerieCharactersProvider: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var characters: [ComicCharacter] = []
    
    weak var delegate: SerieCharactersPresentation?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharactersCell.identifier, for: indexPath) as! CharactersCell
        let character = characters[indexPath.row]
        let model = SerieCharactersCellViewModel(title: character.name, thumbnailURL: character.thumbnail?.url)
        cell.configure(withModel: model)
        return cell
    }
}
