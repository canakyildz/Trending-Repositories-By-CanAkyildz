//
//  RepositoryCodable.swift
//  TestApp
//
//  Created by Can Akyıldız on 3.11.2021.
//

import Foundation

typealias CodableRepositories = [RepositoryCodable]

struct RepositoryCodable: Codable {
    let items: [Item]
}

struct Item: Codable {
    
    let id: Int
    let name: String
    let description: String?
    let owner: Owner
    let stargazersCount: Int
    let language: String?
    let forks: Int
    
    enum CodingKeys: String, CodingKey {
        case id, name, description, owner, forks, language
        case stargazersCount
    }
}

