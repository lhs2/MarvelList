//
//  UIViewController.swift
//  MarvelList
//
//  Created by Luiz Henrique de Sousa on 12/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func alert(title:String = "ERROR_TITLE".localized, error:String, buttonTexts: [String], completion: ((Int) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: error, preferredStyle: .alert)
        for (_, text) in buttonTexts.enumerated() {
            alert.addAction(UIAlertAction(title: text, style: .default, handler: nil))
        }
        self.present(alert, animated: true, completion: nil)
    }

}

enum ViewControllerUtils {
    
    static func setRootViewController(window: UIWindow, viewController: UIViewController, withAnimation: Bool) {

        if !withAnimation {
            window.rootViewController = viewController
            window.makeKeyAndVisible()
            return
        }

        if let snapshot = window.snapshotView(afterScreenUpdates: true) {
            viewController.view.addSubview(snapshot)
            window.rootViewController = viewController
            window.makeKeyAndVisible()
            
            UIView.animate(withDuration: 0.4, animations: {
                snapshot.layer.opacity = 0
            }, completion: { _ in
                snapshot.removeFromSuperview()
            })
        }
    }
    
}
