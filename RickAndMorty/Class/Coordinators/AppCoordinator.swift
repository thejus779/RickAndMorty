//
//  AppCoordinator.swift
//  RickAndMorty
//
//  Created by Thejus Thejus on 21/01/2023.
//

import Foundation
import UIKit

class AppCoordinator {
    
    let engine: Engine
    
    private var window: UIWindow
    
//    private var searchCoordinator: SearchCoordinator?
    var rootController: UINavigationController?
    
    init(engine: Engine, launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        self.engine = engine
                
        // 1. Create and configure main window
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        self.window = window

        // 2. Create and configure main controller
//        self.configureMainController()

    }
    
    // MARK: - Root controller
//    private func configureMainController() {
//        let coordinator = configureSearchCoordinator()
//        window.rootViewController = coordinator.navigationController
//        rootController = coordinator.navigationController
//
//    }

//    private func configureSearchCoordinator() -> SearchCoordinator {
//        let coordinator = SearchCoordinator(engine: engine)
//        self.searchCoordinator = coordinator
//        return coordinator
//    }
}
