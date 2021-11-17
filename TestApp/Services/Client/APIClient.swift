//
//  RepositoriesClient.swift
//  TestApp
//
//  Created by Can Akyıldız on 3.11.2021.
//


import Foundation

class APIClient {
    
    static var shared = APIClient()
    lazy var requestObservable = ObservableAPIRequest(config: .default)
    
    func questRepositories() throws -> Observable<RepositoryCodable> {
        return requestObservable.callAPI(request: try RepositoryRouter.questRepositories.asURLRequest())

    }
    
}
