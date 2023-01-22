//
//  CharachterDetailsViewController.swift
//  RickAndMorty
//
//  Created by Thejus Thejus on 22/01/2023.
//

import UIKit
import SDWebImage
class CharachterDetailsViewController: UIViewController, Spawnable {
    
    @IBOutlet private weak var charachterImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var speciesLabel: UILabel!
    @IBOutlet private weak var mortalStatusLabel: UILabel!
    
    static var storyboardName: String = R.storyboard.main.name
    var viewModel: CharachterDetailsViewModel?
    
    static func spawn(viewModel: CharachterDetailsViewModel) -> CharachterDetailsViewController {
        let controller = CharachterDetailsViewController.spawn()
        controller.viewModel = viewModel
        controller.title = viewModel.charachter.name
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = viewModel?.name
        speciesLabel.text = viewModel?.species
        mortalStatusLabel.text = viewModel?.mortalStatus
        mortalStatusLabel.textColor = viewModel?.statusColor
        charachterImageView.sd_setImage(
            with: viewModel?.imageUrl,
            completed: nil
        )
    }
}
