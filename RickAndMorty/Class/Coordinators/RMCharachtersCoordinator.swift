//
//  RMCharachtersCoordinator.swift
//  RickAndMorty
//
//  Created by Thejus Thejus on 21/01/2023.
//

import Foundation
import UIKit

protocol RMCharachtersCoordinatorDelegate: AnyObject {
}

class RMCharachtersCoordinator: NSObject, NavigatorPresentable {
    
    var navigationController: UINavigationController
    let engine: Engine
    

    init(engine: Engine) {
        self.engine = engine
        navigationController = HideBackTitleNavigationController()
        
        super.init()
                
        let ch = CharachtersViewController.spawn()
        navigationController.setViewControllers([ch], animated: false)

    }
}

extension RMCharachtersCoordinator: RMCharachtersCoordinatorDelegate {}

extension RMCharachtersCoordinator: TabBarRepresentable {
    var icon: UIImage {
        UIImage(systemName: "xmark.circle")!
    }

    var title: String {
        return "Cast"
    }
}
