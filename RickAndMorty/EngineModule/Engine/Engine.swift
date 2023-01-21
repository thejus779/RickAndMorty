//
//  Engine.swift
//  RickAndMorty
//
//  Created by Thejus Thejus on 21/01/2023.
//

import Foundation

class Engine {
        
    private let networkClient: NetworkClient
    
    // Services
    let rMService: RMService
    
    init(
        mockRMService: RMService? = nil,
        mockNetworkClient: RMNetworkClient? = nil
    ) {
        let networkClient = mockNetworkClient ?? RMNetworkClient()
        // Network client
        self.networkClient = networkClient
        
        // RMService
        self.rMService = mockRMService ?? RMNetworkService(networkClient: networkClient)
    }
}
