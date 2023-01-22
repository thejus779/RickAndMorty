//
//  RMCharachter.swift
//  RickAndMorty
//
//  Created by Thejus Thejus on 22/01/2023.
//

import Foundation

struct RMCharachter: Codable {
    let id: Int
    let name: String
    let status: Status
    let species: String
    let image: String
    let episode: [String]
}
enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown
}
