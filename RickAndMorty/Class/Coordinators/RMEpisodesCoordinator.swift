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
                
        let episodesViewController = EpisodesViewController.spawn(
            viewModel: EpisodesViewModel(engine: engine)
        )
        episodesViewController.title = R.string.localizable.commonEpisodes()
        navigationController.setViewControllers([episodesViewController], animated: false)
    }
}

extension RMEpisodesCoordinator: RMEpisodesCoordinatorDelegate {
}

extension RMEpisodesCoordinator: TabBarRepresentable {
    var icon: UIImage {
        UIImage(systemName: "video.circle")!
    }
    var title: String {
        return R.string.localizable.commonEpisodes()
    }
}
