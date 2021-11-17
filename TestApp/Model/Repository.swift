//
//  Repository.swift
//  TestApp
//
//  Created by Can Akyıldız on 4.11.2021.
//

// MARK: - RepositoryModel

import UIKit

class Repository {
        
    private (set) var repoDescription: String
    private (set) var name: String
    private (set) var owner: String
    private (set) var language: String
    private (set) var starsCount: Int
    private (set) var forksCount: Int

    
    init(repoDescription: String, name: String, owner: String,language: String, starsCount: Int, forksCount: Int) {
        self.repoDescription = repoDescription
        self.name = name
        self.owner = owner
        self.language = language
        self.starsCount = starsCount
        self.forksCount = forksCount
    }
    
    init(codable: Item){
        self.repoDescription = codable.description ?? ""
        self.name = codable.name
        self.owner = codable.owner.login
        self.language = codable.language ?? ""
        self.starsCount = codable.stargazersCount
        self.forksCount = codable.forks
        
    }
    
    init(){
        self.repoDescription = ""
        self.name = ""
        self.owner = ""
        self.language = ""
        self.starsCount = 0
        self.forksCount = 0
        
    }
}
