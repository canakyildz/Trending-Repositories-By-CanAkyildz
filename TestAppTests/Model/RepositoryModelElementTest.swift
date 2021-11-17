//
//  RepositoryModelElementTest.swift
//  TestAppTests
//
//  Created by Can Akyıldız on 6.11.2021.
//

import XCTest
@testable import TestApp

class RepositoryModelTest: XCTestCase {
    
    
    let repo1 = Repository(repoDescription: "A list of helpful front-end related questions you can use to interview potential canditates, test yourself or completely ignore.", name: "Front-end-Developer-Interview-Questions", owner: "h5bp", language: "Nunjucks", starsCount: 51226, forksCount: 10058)
    
    let repo2 = Repository()
    
    func testEventWithNoInformation() {
        XCTAssertTrue(repo2.name.isEmpty)
        XCTAssertTrue(repo2.owner.isEmpty)
        XCTAssertTrue(repo2.forksCount == 0)
        XCTAssertTrue(repo2.starsCount == 0)
        XCTAssertTrue(repo2.language.isEmpty)
        
    }
    
    func testRepoArrayWithoutRepos() {
        let repos = Repositories()
        XCTAssertTrue(repos.isEmpty)
    }
    
    func testRepoArrayWithRepos() {
        let repos = [repo1, repo2]
        XCTAssertFalse(repos.isEmpty)
        XCTAssertTrue(repos.count > 0)
        XCTAssertTrue(repos.count == 2)
    }
    
    func testRepoTitle() {
        XCTAssertTrue(repo1.name == "Front-end-Developer-Interview-Questions")
        XCTAssertFalse(repo1.name.isEmpty)
    }
    
    func testRepoDescription() {
        XCTAssertFalse(repo1.repoDescription == "Bla bla bla")
        XCTAssertFalse(repo1.repoDescription.isEmpty)
    }
}
