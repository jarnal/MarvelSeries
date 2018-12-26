//
//  Alertable.swift
//  LumAppsComics
//
//  Created by Jonathan Arnal on 17/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import UIKit

protocol Alertable {
    func alert(withMessage message: String?)
    func alert(withError error: Error?)
}
extension Alertable where Self: UIViewController {
    
    /// ℹ️ Show debug specific message inside alert view controller
    ///
    /// - Parameter message: message to show inside popup
    func alert(withMessage message: String?) {
        
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { (action) in
            alert.dismiss(animated: false, completion: nil)
        }
        alert.addAction(okAction)
        
        DispatchQueue.main.async {
            self.present(alert, animated: false)
        }
    }
    
    /// ℹ️ Show debug specific message inside alert view controller
    ///
    /// - Parameter error: error to show inside popup
    func alert(withError error: Error?) {
        
        guard let unwrappedError = error else { return }
        alert(withMessage: unwrappedError.localizedDescription)
    }
    
}
