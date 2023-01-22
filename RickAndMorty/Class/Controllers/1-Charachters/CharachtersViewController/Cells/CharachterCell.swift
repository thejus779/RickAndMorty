//
//  CharachterCell.swift
//  RickAndMorty
//
//  Created by Thejus Thejus on 22/01/2023.
//

import UIKit
import SDWebImage

class CharachterCell: UITableViewCell, ShadowWrapped {

    @IBOutlet internal weak var containerView: UIView!
    @IBOutlet private weak var charachterImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var speciesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureShadowedContainer()
    }
    
    func configure(viewModel: CharachterCellViewModel) {
        nameLabel.text = viewModel.name
        speciesLabel.text = viewModel.species
        charachterImageView.sd_setImage(
            with: viewModel.imageUrl,
            completed: nil
        )
    }

}
