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
    private var tabController: RMTabController?
    
    private var rMCharachtersCoordinator: RMCharachtersCoordinator?
    private var rMEpisodesCoordinator: RMEpisodesCoordinator?
    private var rMLocationsCoordinator: RMLocationsCoordinator?
    
    var rootController: UINavigationController?
    
    init(engine: Engine, launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        self.engine = engine
        
        // 1. Create and configure main window
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        self.window = window
        
        //2. Create and configure main controller
        self.configureMainController()
        
    }
    
//    // MARK: - Root controller
//    private func configureMainController() {
//        let coordinator = configureChrachtersCoordinator()
//        window.rootViewController = coordinator.navigationController
//        rootController = coordinator.navigationController
//
//    }
    
//    private func configureChrachtersCoordinator() -> RMCharachtersCoordinator {
//        let coordinator = RMCharachtersCoordinator(engine: engine)
//        self.rMCharachtersCoordinator = coordinator
//        return coordinator
//    }
//
    func configureMainController() {
        let tabController = RMTabController(engine: engine)
        window.rootViewController = tabController
        self.tabController = tabController
        self.configureTabController(tabController)
    }
    
    private func configureTabController(_ controller: RMTabController) {
        var index = 0
        var vcs = [UIViewController]()
        while let tabIndex = TabIndex(rawValue: index) {
            let coordinator = self.configureCoordinator(tabIndex: tabIndex)
            coordinator.navigationController.tabBarItem = UITabBarItem(title: coordinator.title, image: coordinator.icon, selectedImage: nil)
            vcs.append(coordinator.navigationController)
            index += 1
        }
        controller.viewControllers = vcs
    }
    
    private func configureCoordinator(tabIndex: TabIndex) -> TabBarRepresentable & NavigatorPresentable {
        switch tabIndex {
        case .charachets:
            self.rMCharachtersCoordinator = RMCharachtersCoordinator(engine: engine)
            return self.rMCharachtersCoordinator!
        case .locations:
//            self.rMLocationsCoordinator = RMLocationsCoordinator(engine: engine)
//            return self.rMLocationsCoordinator!
            self.rMCharachtersCoordinator = RMCharachtersCoordinator(engine: engine)
            return self.rMCharachtersCoordinator!
        case .episodes:
//            self.rMEpisodesCoordinator = RMEpisodesCoordinator(engine: engine)
//            return self.rMEpisodesCoordinator!
            self.rMCharachtersCoordinator = RMCharachtersCoordinator(engine: engine)
            return self.rMCharachtersCoordinator!
        }
    }
}

enum TabIndex: Int {
    case charachets = 0
    case locations = 1
    case episodes = 2
}
