//
//  LocationCellViewModel.swift
//  RickAndMorty
//
//  Created by Thejus Thejus on 22/01/2023.
//

import Foundation

class LocationCellViewModel {
    let location: RMLocation
    
    init(location: RMLocation) {
        self.location = location
    }
    
    var locationName: String { location.name }
    var locationType: String { location.type }

}
