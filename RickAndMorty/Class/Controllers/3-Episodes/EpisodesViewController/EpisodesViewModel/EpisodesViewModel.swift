//
//  EpisodesViewModel.swift
//  RickAndMorty
//
//  Created by Thejus Thejus on 22/01/2023.
//

import Foundation

class EpisodesViewModel {
    private let engine: Engine
    
    var allEpisodes: [RMEpisode] = []
    var responseData: RMData<RMEpisode>?
    var currentPage = 1
    
    init(engine: Engine) {
        self.engine = engine
    }
    
    // Get all locations
    func getAllEpisodes(completion: @escaping ResultCallback<RMData<RMEpisode>>)  {
        
        engine.rMService.getAllEpisodes(pageNo: currentPage) { [weak self] result in
            switch result {
            case .success(let response):
                self?.responseData = response
                self?.allEpisodes = response.results
            default: break
            }
            completion(result)
        }
    }

    func loadMoreEpisodesIfNeeded(completion: @escaping (Error?) -> Void )  {
        guard currentPage < responseData?.info.pages ?? 0
        else {
            // All data loaded alraedy
            print("All episodes loaded already")
            completion(nil)
            return
        }
        let pageNo = currentPage + 1
        engine.rMService.getAllEpisodes(pageNo: pageNo) { [weak self] result in
            switch result {
            case .success(let newResponse):
                self?.responseData = newResponse
                self?.allEpisodes.append(contentsOf: newResponse.results)
                
                // Update page incase of success so that later if the user scrolls more data can be loaded
                self?.currentPage = pageNo
                
                print("Added \(newResponse.results.count) more episodes")
                completion(nil)
                
            case .failure(let error):
                print("Failed with error \(error)")
                completion(error)
            }
        }
    }
}
