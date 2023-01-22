//
//  RMNetworkService.swift
//  RickAndMorty
//
//  Created by Thejus Thejus on 21/01/2023.
//

import Foundation

class RMNetworkService: RMService {
    
    var networkClient: RMNetworkClient?
    
    required init(networkClient: RMNetworkClient?) {
        self.networkClient = networkClient
    }
    
    /// get all episodes paginated
    func getAllEpisodes(pageNo: Int, completion: @escaping ResultCallback<RMData<RMEpisode>>) {
        // 1. Set pageNo as paramters
        let parameters: [String : Any] = ["page": pageNo]
        
        // get all episodes network call
        networkClient?.request(
            endpoint: RMEndPoints.getEpisodes,
            parameters: parameters,
            completion: { result in
                switch result {
                case .success(data: let data):
                    if let data = data {
                        do {
                            var decoder = JSONDecoder()
                            let df = DateFormatter()
                            df.dateFormat = "MMMM d, yyyy"
                            decoder.dateDecodingStrategy = .formatted(df)
                            
                            let epResponse = try decoder.decode(RMData<RMEpisode>.self, from: data)
                            completion(.success(epResponse))
                            print("[RMNetworkService] getAllEpisodes success for page \(pageNo)")
                        } catch let error {
                            completion(.failure(error))
                            print("[RMNetworkService] getAllEpisodes decoding error: \(error)")
                        }
                    } else {
                        completion(.failure(RMError.noData))
                        print("[RMNetworkService] getAllEpisodes no data")
                    }
                case .error(let error):
                    completion(.failure(error))
                    print("[RMNetworkService] getAllEpisodes error: \(error)")
                }
            }
        )
    }
    
    /// get all locations paginated
    func getAllLocations(pageNo: Int, completion: @escaping ResultCallback<RMData<RMLocation>>) {
        // 1. Set pageNo as paramters
        let parameters: [String : Any] = ["page": pageNo]
        
        // get all locations network call
        networkClient?.request(
            endpoint: RMEndPoints.getLocations,
            parameters: parameters,
            completion: { result in
                switch result {
                case .success(data: let data):
                    if let data = data {
                        do {
                            let locationResponse = try JSONDecoder().decode(RMData<RMLocation>.self, from: data)
                            completion(.success(locationResponse))
                            print("[RMNetworkService] getAllLocations success for page \(pageNo)")
                        } catch let error {
                            completion(.failure(error))
                            print("[RMNetworkService] getAllLocations decoding error: \(error)")
                        }
                    } else {
                        completion(.failure(RMError.noData))
                        print("[RMNetworkService] getAllLocations no data")
                    }
                case .error(let error):
                    completion(.failure(error))
                    print("[RMNetworkService] getAllLocations error: \(error)")
                }
            }
        )
    }
    
    /// get all charachters paginated
    func getAllCharachters(pageNo: Int, completion: @escaping ResultCallback<RMData<RMCharachter>>) {
        // 1. Set pageNo as paramters
        let parameters: [String : Any] = ["page": pageNo]
        
        // get all charachters network call
        networkClient?.request(
            endpoint: RMEndPoints.getCharacters,
            parameters: parameters,
            completion: { result in
                switch result {
                case .success(data: let data):
                    if let data = data {
                        do {
                            let charachtersResponse = try JSONDecoder().decode(RMData<RMCharachter>.self, from: data)
                            completion(.success(charachtersResponse))
                            print("[RMNetworkService] getAllCharachters success for page \(pageNo)")
                        } catch let error {
                            completion(.failure(error))
                            print("[RMNetworkService] getAllCharachters decoding error: \(error)")
                        }
                    } else {
                        completion(.failure(RMError.noData))
                        print("[RMNetworkService] getAllCharachters no data")
                    }
                case .error(let error):
                    completion(.failure(error))
                    print("[RMNetworkService] getAllCharachters error: \(error)")
                }
            }
        )
    }
}
