//
//  RMServiceTest.swift
//  RickAndMortyTests
//
//  Created by Thejus Thejus on 22/01/2023.
//

import XCTest
@testable import RickAndMorty

final class RMServiceTest: XCTestCase {

    let testEngine = Engine()
    
    func testGetCharactersTests() {
        let expectation = self.expectation(description: "testGetCharactersTests")
        testEngine.rMService.getAllCharachters(
            pageNo: 1
        ){ result in
            switch result {
            case .success(let ds):
                XCTAssertFalse(ds.results.isEmpty)
            case .failure:
                XCTFail()
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testGetLocationsTests() {
        let expectation = self.expectation(description: "testGetLocationsTests")
        testEngine.rMService.getAllLocations(
            pageNo: 1
        ){ result in
            switch result {
            case .success(let ds):
                XCTAssertFalse(ds.results.isEmpty)
            case .failure:
                XCTFail()
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    func testGetEpisodesTests() {
        let expectation = self.expectation(description: "testGetEpisodesTests")
        testEngine.rMService.getAllEpisodes(
            pageNo: 1
        ){ result in
            switch result {
            case .success(let ds):
                XCTAssertFalse(ds.results.isEmpty)
            case .failure:
                XCTFail()
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }

}
