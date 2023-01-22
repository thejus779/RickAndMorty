//
//  CharachterDetailsViewModel.swift
//  RickAndMorty
//
//  Created by Thejus Thejus on 22/01/2023.
//

import UIKit

class CharachterDetailsViewModel {
    private let engine: Engine
    let charachter: RMCharachter
    
    init(engine: Engine, charachter: RMCharachter) {
        self.engine = engine
        self.charachter = charachter
    }
    
    var imageUrl: URL? { URL(string: charachter.image) }
    var name: String { charachter.name }
    var species: String { charachter.species }
    var mortalStatus: String {
        R.string.localizable.charachterDetailsMortalStatus(charachter.status.rawValue)
    }
    var statusColor: UIColor {
        switch charachter.status {
        case .alive:
            return UIColor.systemGreen
        case .dead:
            return UIColor.systemRed
        case .unknown:
            return UIColor.systemYellow
        }
    }
}
