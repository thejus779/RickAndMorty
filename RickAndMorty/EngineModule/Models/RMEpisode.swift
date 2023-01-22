//
//  RMEpisode.swift
//  RickAndMorty
//
//  Created by Thejus Thejus on 22/01/2023.
//

import Foundation

/*
 {
       "id": 1,
       "name": "Pilot",
       "air_date": "December 2, 2013",
       "episode": "S01E01",
       "characters": [
         "https://rickandmortyapi.com/api/character/1",
         "https://rickandmortyapi.com/api/character/2",
         //...
       ],
       "url": "https://rickandmortyapi.com/api/episode/1",
       "created": "2017-11-10T12:56:33.798Z"
     }
 */
struct RMEpisode: Codable {
    let id: Int
    let name: String
    let airDate: Date
    let episode: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case airDate = "air_date"
        case episode
    }
}
