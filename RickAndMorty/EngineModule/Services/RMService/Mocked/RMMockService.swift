//
//  RMMockService.swift
//  RickAndMorty
//
//  Created by Thejus Thejus on 21/01/2023.
//

import Foundation

class RMMockService: RMService {
    
    var networkClient: RMNetworkClient?
    
    required init(networkClient: RMNetworkClient?) {
        self.networkClient = networkClient
    }
    
    /// get all episodes paginated
    func getAllEpisodes(pageNo: Int, completion: @escaping ResultCallback<RMData<RMEpisode>>) {
        completion(
            .success(
                RMData(
                    info: RMData.RMInfo(pages: 1),
                    results: [
                        RMEpisode(id: 1, name: "Test 1", airDate: Date(), episode: "Ep1s1"),
                        RMEpisode(id: 2, name: "Test 2", airDate: Date(), episode: "Ep2s1")
                    ]
                )
            )
        )
    }
    
    /// get all locations paginated
    func getAllLocations(pageNo: Int, completion: @escaping ResultCallback<RMData<RMLocation>>) {
        completion(
            .success(
                RMData(
                    info: RMData.RMInfo(pages: 1),
                    results: [
                        RMLocation(id: 1, name: "Loc 1", type: "Type1"),
                        RMLocation(id: 2, name: "Loc 2", type: "Type2")
                    ]
                )
            )
        )
    }
    
    /// get all charachters paginated
    func getAllCharachters(pageNo: Int, completion: @escaping ResultCallback<RMData<RMCharachter>>) {
        completion(
            .success(
                RMData(
                    info: RMData.RMInfo(pages: 1),
                    results: [
                        RMCharachter(id: 1, name: "Char 1", status: .alive, species: "Species", image: "", episode: []),
                        RMCharachter(id: 2, name: "Char 2", status: .dead, species: "Species", image: "", episode: [])
                    ]
                )
            )
        )
    }
}
