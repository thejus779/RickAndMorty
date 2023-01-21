//
//  RMEpisodesCoordinator.swift
//  RickAndMorty
//
//  Created by Thejus Thejus on 21/01/2023.
//

import Foundation
import UIKit

protocol RMEpisodesCoordinatorDelegate: AnyObject {
}

class RMEpisodesCoordinator: NSObject, NavigatorPresentable {
    
    var navigationController: UINavigationController
    let engine: Engine
    

    init(engine: Engine) {
        self.engine = engine
        navigationController = HideBackTitleNavigationController()
        
        super.init()
                
//        let searchProductsViewController = SearchProductsViewController.spawn(
//            searchCoordinatorDelegate: self,
//            viewModel: SearchProductsViewModel(engine: engine)
//        )
//        navigationController.setViewControllers([searchProductsViewController], animated: false)

    }
}

extension RMEpisodesCoordinator: RMEpisodesCoordinatorDelegate {
}

extension RMEpisodesCoordinator: TabBarRepresentable {
    var icon: UIImage {
        return UIImage()
    }

    var title: String {
        return "Episodes"
    }
}
