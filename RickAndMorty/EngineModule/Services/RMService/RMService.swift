//
//  RMService.swift
//  RickAndMorty
//
//  Created by Thejus Thejus on 21/01/2023.
//

import Foundation

protocol RMService: AnyObject {
    var networkClient: RMNetworkClient? { get set }    
    /// Initializer
    init(networkClient: RMNetworkClient?)
}
