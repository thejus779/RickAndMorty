//
//  EpisodeCellViewModel.swift
//  RickAndMorty
//
//  Created by Thejus Thejus on 22/01/2023.
//

import Foundation

class EpisodeCellViewModel {
    let episode: RMEpisode
    
    init(episode: RMEpisode) {
        self.episode = episode
    }
    
    var episodeName: String { episode.name }
    var episodeNumber: String { episode.episode }
    var episodeAirDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d, yyyy"
        return dateFormatter.string(from: episode.airDate)
    }

}
