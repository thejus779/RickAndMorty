//
//  ShadowWrapped.swift
//  RickAndMorty
//
//  Created by Thejus Thejus on 22/01/2023.
//

import UIKit

protocol ShadowWrapped: AnyObject {
    var containerView: UIView! { get }
}
extension ShadowWrapped {
    func configureShadowedContainer() {
        containerView.layer.cornerRadius = 6
        containerView.shadowStyle = .medium
    }
}
