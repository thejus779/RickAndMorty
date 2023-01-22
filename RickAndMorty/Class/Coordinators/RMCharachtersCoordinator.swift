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
                
        let charachtersViewController = CharachtersViewController.spawn()
        navigationController.setViewControllers([charachtersViewController], animated: false)
        navigationController.navigationBar.isHidden = true
    }
}

extension RMCharachtersCoordinator: RMCharachtersCoordinatorDelegate {}

extension RMCharachtersCoordinator: TabBarRepresentable {
    var icon: UIImage {
        UIImage(systemName: "person.circle")!
    }
    var title: String {
        return "Cast"
    }
}
