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

}
