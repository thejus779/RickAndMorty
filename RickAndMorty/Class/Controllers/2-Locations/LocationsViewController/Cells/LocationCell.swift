//
//  LocationCell.swift
//  RickAndMorty
//
//  Created by Thejus Thejus on 22/01/2023.
//

import UIKit

class LocationCell: UITableViewCell, ShadowWrapped {

    @IBOutlet private weak var locationTypeLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet internal weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureShadowedContainer()
    }

    func configure(viewModel: LocationCellViewModel) {
        locationTypeLabel.text = viewModel.locationType
        locationLabel.text = viewModel.locationName
    }
}
