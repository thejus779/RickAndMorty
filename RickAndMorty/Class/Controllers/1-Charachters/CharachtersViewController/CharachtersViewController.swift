//
//  CharachtersViewController.swift
//  RickAndMorty
//
//  Created by Thejus Thejus on 21/01/2023.
//

import UIKit

class CharachtersViewController: UIViewController, Spawnable {
    
    static var storyboardName: String = "Main"
    
    weak var charachtersCoordinatorDelegate: RMCharachtersCoordinatorDelegate?
    var viewModel: CharachtersViewModel!
    
    static func spawn(charachtersCoordinatorDelegate: RMCharachtersCoordinatorDelegate?, viewModel: CharachtersViewModel) -> CharachtersViewController {
        let controller = CharachtersViewController.spawn()
        controller.charachtersCoordinatorDelegate = charachtersCoordinatorDelegate
        controller.viewModel = viewModel
        return controller
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
