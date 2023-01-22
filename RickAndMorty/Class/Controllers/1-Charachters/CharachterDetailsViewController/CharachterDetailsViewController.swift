//
//  CharachterDetailsViewController.swift
//  RickAndMorty
//
//  Created by Thejus Thejus on 22/01/2023.
//

import UIKit

class CharachterDetailsViewController: UIViewController, Spawnable {
    
    static var storyboardName: String = "Main"
    var viewModel: CharachterDetailsViewModel?
    
    static func spawn(viewModel: CharachterDetailsViewModel) -> CharachterDetailsViewController {
        let controller = CharachterDetailsViewController.spawn()
        controller.viewModel = viewModel
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
