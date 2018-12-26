//
//  Windowable.swift
//  LumAppsComics
//
//  Created by Jonathan Arnal on 19/12/2018.
//  Copyright © 2018 Jonathan Arnal. All rights reserved.
//

import UIKit

protocol Windowable: class {
    
    var window: UIWindow? { get set }
    var duration: Double { get }
}
extension Windowable where Self: UIViewController {
    
    //****************************************************
    // MARK: - Window business
    //****************************************************
    
    /// 📲 Show the current controller in a new window
    func show() {
        
        view.alpha = 0
        if window == nil {
            let newWindow = UIWindow(frame: UIScreen.main.bounds)
            newWindow.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            newWindow.isOpaque = false
            newWindow.backgroundColor = UIColor.clear
            newWindow.rootViewController = self
            
            window = newWindow
        }
        
        window?.makeKeyAndVisible()
        
        animateIn(duration: duration, then: nil)
    }
    
    /// 📲 Hides the current controller
    func hide(then completion: (() -> Void)?) {
        animateOut(duration: duration, then: {
            self.window?.isHidden = true
            self.window?.removeFromSuperview()
            self.window = nil
            completion?()
        })
    }
    
    //****************************************************
    // MARK: - Animations
    //****************************************************
    
    /// 💫 Animates the current controller when it's added to window
    ///
    /// - Parameters:
    ///   - duration: duration of the animation
    ///   - completion: completion block called after animation is finished
    private func animateIn(duration: Double, then completion: (() -> Void)?) {
        
        view.frame = CGRect(x: 0, y: self.view.frame.height, width: self.view.frame.width, height: self.view.frame.height)
        UIView.animate(withDuration: duration, animations: {
            self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
            self.view.alpha = 1
        }, completion: { (finished) in
            completion?()
        })
    }
    
    /// 💫 Animates the current controller when it's removed from window
    ///
    /// - Parameters:
    ///   - duration: duration of the animation
    ///   - completion: completion block called after animation is finished
    private func animateOut(duration: Double, then completion: (() -> Void)?) {
        
        view.layer.removeAllAnimations()
        UIView.animate(withDuration: duration, animations: { () -> Void in
            self.view.frame = CGRect(x: 0, y: self.view.frame.height, width: self.view.frame.width, height: self.view.frame.height)
            self.view.alpha = 0
        }) { (finished) -> Void in
            completion?()
        }
    }
    
}
