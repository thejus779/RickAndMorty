//
//  UIActivityIndicator+Extensions.swift
//  RickAndMorty
//
//  Created by Thejus Thejus on 22/01/2023.
//

import UIKit

extension UIActivityIndicatorView {
    /// Show loader and start spinning
    func showLoader() {
        isHidden = false
        startAnimating()
    }
    /// Hide loader
    func hideLoader() {
        hidesWhenStopped = true
        stopAnimating()
    }
}
