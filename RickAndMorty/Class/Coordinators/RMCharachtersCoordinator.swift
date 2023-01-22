//
//  RMCharachtersCoordinator.swift
//  RickAndMorty
//
//  Created by Thejus Thejus on 21/01/2023.
//

import Foundation
import UIKit

protocol RMCharachtersCoordinatorDelegate: AnyObject {
    func showDetails(of character: RMCharachter)
}

class RMCharachtersCoordinator: NSObject, NavigatorPresentable {
    
    var navigationController: UINavigationController
    let engine: Engine
    

    init(engine: Engine) {
        self.engine = engine
        navigationController = HideBackTitleNavigationController()
        
        super.init()
                
        let charachtersViewController = CharachtersViewController.spawn(
            charachtersCoordinatorDelegate: self,
            viewModel: CharachtersViewModel(engine: engine)
        )
        charachtersViewController.title = R.string.localizable.commonCharachters()
        navigationController.setViewControllers([charachtersViewController], animated: false)
    }
}

extension RMCharachtersCoordinator: RMCharachtersCoordinatorDelegate {
    func showDetails(of character: RMCharachter) {
        let charachterDetailsViewController = CharachterDetailsViewController.spawn(
            viewModel: CharachterDetailsViewModel(
                engine: engine, charachter: character
            )
        )
        navigationController.pushViewController(charachterDetailsViewController, animated: true)
    }
}

extension RMCharachtersCoordinator: TabBarRepresentable {
    var icon: UIImage {
        UIImage(systemName: "person.circle")!
    }
    var title: String {
        return R.string.localizable.commonCharachters()
    }
}
