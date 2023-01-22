//
//  LocationsViewController.swift
//  RickAndMorty
//
//  Created by Thejus Thejus on 22/01/2023.
//

import UIKit

class LocationsViewController: UIViewController, Spawnable {
    
    static var storyboardName: String = "Main"

    var viewModel: LocationsViewModel!
    
    static func spawn(viewModel: LocationsViewModel) -> LocationsViewController {
        let controller = LocationsViewController.spawn()
        controller.viewModel = viewModel
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
