//
//  RepositoryDetailViewModel.swift
//  TestApp
//
//  Created by Can Akyıldız on 6.11.2021.
//

import Foundation

class RepositoryDetailViewModel {
    
    func viewDidLoad() {
        
    }
    
    func setRepository(_ repository: Repository) {
        self.model = repository
    }
    
    var isLoad: BehaviorRelay<Bool> = BehaviorRelay<Bool>(value: false)
    
    private var model: Repository = Repository()
    
    
    func getDescription() -> String {
        return model.repoDescription
    }
    
    func getStarsCount() -> String {
        return "\(model.starsCount)"
    }
    
    func getForksCount() -> String {
        return "\(model.forksCount)"
    }
    func getLanguage() -> String {
        return model.language
    }
    
    func getTitle() -> String {
        return "\(model.owner) / \(model.name)"

    }
    
}
