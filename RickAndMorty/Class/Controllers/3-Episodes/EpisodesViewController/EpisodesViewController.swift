//
//  EpisodesViewController.swift
//  RickAndMorty
//
//  Created by Thejus Thejus on 22/01/2023.
//

import UIKit

class EpisodesViewController: UIViewController, Spawnable {
    
    static var storyboardName: String = "Main"

    var viewModel: EpisodesViewModel!
    
    static func spawn(viewModel: EpisodesViewModel) -> EpisodesViewController {
        let controller = EpisodesViewController.spawn()
        controller.viewModel = viewModel
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
