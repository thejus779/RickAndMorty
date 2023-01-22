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

        let locationsViewController = LocationsViewController.spawn(
            viewModel: LocationsViewModel(engine: engine)
        )
        locationsViewController.title = R.string.localizable.commonLocations()
        navigationController.setViewControllers([locationsViewController], animated: false)

    }
}

extension RMLocationsCoordinator: RMLocationsCoordinatorDelegate {
}

extension RMLocationsCoordinator: TabBarRepresentable {
    var icon: UIImage {
        UIImage(systemName: "location.circle")!
    }
    var title: String {
        return R.string.localizable.commonLocations()
    }
}
