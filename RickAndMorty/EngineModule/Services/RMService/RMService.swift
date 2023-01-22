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
    
    /// get all episodes paginated
    func getAllEpisodes(pageNo: Int, completion: @escaping ResultCallback<RMData<RMEpisode>>)
    
    /// get all locations paginated
    func getAllLocations(pageNo: Int, completion: @escaping ResultCallback<RMData<RMLocation>>)
    
    /// get all charachters paginated
    func getAllCharachters(pageNo: Int, completion: @escaping ResultCallback<RMData<RMCharachter>>)
}
