//
//  CharachtersViewModel.swift
//  RickAndMorty
//
//  Created by Thejus Thejus on 22/01/2023.
//

import Foundation

class CharachtersViewModel {
    private let engine: Engine
    
    var allCharachters: [RMCharachter] = []
    var responseData: RMData<RMCharachter>?
    var currentPage = 1
    
    init(engine: Engine) {
        self.engine = engine
    }
    
    // Get all charachters
    func getAllCharachters(completion: @escaping ResultCallback<RMData<RMCharachter>>)  {
        
        engine.rMService.getAllCharachters(pageNo: currentPage) { [weak self] result in
            switch result {
            case .success(let response):
                self?.responseData = response
                self?.allCharachters = response.results
            default: break
            }
            completion(result)
        }
    }

    func loadMoreCharachtersIfNeeded(completion: @escaping (Error?) -> Void )  {
        guard currentPage < responseData?.info.pages ?? 0
        else {
            // All data loaded alraedy
            print("All charachters loaded already")
            completion(nil)
            return
        }
        let pageNo = currentPage + 1
        engine.rMService.getAllCharachters(pageNo: pageNo) { [weak self] result in
            switch result {
            case .success(let newResponse):
                self?.responseData = newResponse
                self?.allCharachters.append(contentsOf: newResponse.results)
                
                // Update page incase of success so that later if the user scrolls more data can be loaded
                self?.currentPage = pageNo
                
                print("Added \(newResponse.results.count) more charachters")
                completion(nil)
                
            case .failure(let error):
                print("Failed with error \(error)")
                completion(error)
            }
        }
    }
}
