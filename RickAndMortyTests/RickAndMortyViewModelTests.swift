//
//  RickAndMortyTests.swift
//  RickAndMortyTests
//
//  Created by Thejus Thejus on 21/01/2023.
//

import XCTest
@testable import RickAndMorty

final class RickAndMortyTests: XCTestCase {

    let testableEngine = Engine()
    
    lazy var charachtersViewModel = CharachtersViewModel(engine: testableEngine)
    lazy var locationsViewModel = LocationsViewModel(engine: testableEngine)
    lazy var episodesViewModel = EpisodesViewModel(engine: testableEngine)
    
    func testCharachtersViewModel() {
        let expectation = self.expectation(description: "testCharachtersViewModel")
        charachtersViewModel.getAllCharachters { [weak self] result in
            guard let self else { fatalError() }
            switch result {
            case .success:
                XCTAssertFalse(self.charachtersViewModel.allCharachters.isEmpty)
            case .failure:
                // Failed to load mocked data
                XCTFail()
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
        loadMoreCharachtersIfNeeded(previousCount: charachtersViewModel.allCharachters.count)
    }
    func loadMoreCharachtersIfNeeded(previousCount: Int) {
        let expectation = self.expectation(description: "loadMoreCharachtersIfNeeded")
        charachtersViewModel.loadMoreCharachtersIfNeeded { [weak self] error in
            guard let self = self else { fatalError() }
            XCTAssertNil(error)
            XCTAssertTrue(self.charachtersViewModel.allCharachters.count > previousCount)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testLocationsViewModel() {
        let expectation = self.expectation(description: "testLocationsViewModel")
        locationsViewModel.getAllLocations { [weak self] result in
            guard let self else { fatalError() }
            switch result {
            case .success:
                XCTAssertFalse(self.locationsViewModel.allLocations.isEmpty)
            case .failure:
                // Failed to load mocked data
                XCTFail()
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
        loadMoreLocationsIfNeeded(previousCount: locationsViewModel.allLocations.count)
    }
    func loadMoreLocationsIfNeeded(previousCount: Int) {
        let expectation = self.expectation(description: "loadMoreCharachtersIfNeeded")
        locationsViewModel.loadMoreLocationsIfNeeded { [weak self] error in
            guard let self = self else { fatalError() }
            XCTAssertNil(error)
            XCTAssertTrue(self.locationsViewModel.allLocations.count > previousCount)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testEpisodesViewModel() {
        let expectation = self.expectation(description: "testEpisodesViewModel")
        episodesViewModel.getAllEpisodes { [weak self] result in
            guard let self else { fatalError() }
            switch result {
            case .success:
                XCTAssertFalse(self.episodesViewModel.allEpisodes.isEmpty)
            case .failure:
                // Failed to load mocked data
                XCTFail()
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
        loadMoreEpisodesIfNeeded(previousCount: episodesViewModel.allEpisodes.count)
    }
    func loadMoreEpisodesIfNeeded(previousCount: Int) {
        let expectation = self.expectation(description: "loadMoreCharachtersIfNeeded")
        episodesViewModel.loadMoreEpisodesIfNeeded { [weak self] error in
            guard let self = self else { fatalError() }
            XCTAssertNil(error)
            XCTAssertTrue(self.episodesViewModel.allEpisodes.count > previousCount)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10, handler: nil)
    }

}
