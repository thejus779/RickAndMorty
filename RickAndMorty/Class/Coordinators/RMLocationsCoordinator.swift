//
//  RMLocationsCoordinator.swift
//  RickAndMorty
//
//  Created by Thejus Thejus on 21/01/2023.
//

import UIKit

protocol RMLocationsCoordinatorDelegate: AnyObject {
}

class RMLocationsCoordinator: NSObject, NavigatorPresentable {
    
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

extension RMLocationsCoordinator: RMLocationsCoordinatorDelegate {
}

extension RMLocationsCoordinator: TabBarRepresentable {
    var icon: UIImage {
        return UIImage()
    }

    var title: String {
        return "Locations"
    }
}
