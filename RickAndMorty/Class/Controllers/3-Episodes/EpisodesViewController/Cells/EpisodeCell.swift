//
//  EpisodeCell.swift
//  RickAndMorty
//
//  Created by Thejus Thejus on 22/01/2023.
//

import UIKit

class EpisodeCell: UITableViewCell, ShadowWrapped {
    
    @IBOutlet private weak var episodeNameLabel: UILabel!
    @IBOutlet private weak var airDateLabel: UILabel!
    @IBOutlet private weak var episodeNumberLabel: UILabel!
    @IBOutlet internal weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureShadowedContainer()
    }
    
    func configure(viewModel: EpisodeCellViewModel) {
        episodeNameLabel.text = viewModel.episodeName
        airDateLabel.text = viewModel.episodeAirDate
        episodeNumberLabel.text = viewModel.episodeNumber
    }
}
