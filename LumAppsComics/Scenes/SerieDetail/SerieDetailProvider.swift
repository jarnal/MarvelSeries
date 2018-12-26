//
//  SerieDetailProvider.swift
//  LumAppsComics
//
//  Created by Jonathan Arnal on 19/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import UIKit

class SerieDetailProvider: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    weak var delegate: SerieDetailPresentation?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // We are doing the same thing a static table view will do
        // Building two types of cells depending on indexPath
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: SerieCharactersCell.identifier) as! SerieCharactersCell
            cell.selectionStyle = .none
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: SerieComicsCell.identifier) as! SerieComicsCell
            cell.selectionStyle = .none
            return cell
        default:
            fatalError("There should not be any other cell here")
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        // Depending on the cell that is going to be displayed
        // We inform the delegate that one container is available for child view controllers
        if let characterscell = cell as? SerieCharactersCell {
            delegate?.didBuildCharactersContainerCell(characterscell)
        } else if let comicsCell = cell as? SerieComicsCell {
            delegate?.didBuildComicsContainerCell(comicsCell)
        }
    }
}
