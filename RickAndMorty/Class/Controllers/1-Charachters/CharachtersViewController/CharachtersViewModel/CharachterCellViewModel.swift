//
//  CharachterCellViewModel.swift
//  RickAndMorty
//
//  Created by Thejus Thejus on 22/01/2023.
//

import Foundation

class CharachterCellViewModel {
    let charachter: RMCharachter
    
    init(charachter: RMCharachter) {
        self.charachter = charachter
    }
    
    var imageUrl: URL? { URL(string: charachter.image) }
    var name: String { charachter.name }
    var species: String { charachter.species }

}
