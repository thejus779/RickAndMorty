//
//  RMData.swift
//  RickAndMorty
//
//  Created by Thejus Thejus on 22/01/2023.
//

import Foundation

struct RMData<T: Codable>: Codable {
    let info: RMInfo
    let results: [T]
    
    struct RMInfo: Codable {
        let next: String?
    }
}
