//
//  RMEndPoints.swift
//  RickAndMorty
//
//  Created by Thejus Thejus on 21/01/2023.
//

import Foundation

enum RMEndPoints: EndpointType {
    case getCharacters
    case getLocations
    case getEpisodes
    
    var path: String {
        switch self {
        case .getCharacters:
            return "/character"
        case .getLocations:
            return "/location"
        case .getEpisodes:
            return "/episode"
        }
    }
    
    var verb: HTTPVerb {
        switch self {
        case .getCharacters, .getLocations, .getEpisodes:
            return .get
        }
    }
    var baseUrl: URL {
        guard let url = URL(string: "https://rickandmortyapi.com/api")
        else { fatalError("Invalid url") }
        return url
    }
}
