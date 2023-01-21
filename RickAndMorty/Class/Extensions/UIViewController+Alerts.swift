//
//  UIViewController+Alerts.swift
//  RickAndMorty
//
//  Created by Thejus Thejus on 21/01/2023.
//

import Foundation
import UIKit

extension UIViewController {
    /// Show a native alert view...
    ///
    /// - Parameter:
    ///   - title: ...with this title...
    ///   - message: ...and this message
    func presentAlert(title: String? = "Error", message: String?, completion: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .destructive, handler: nil)
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: completion)
    }

}
