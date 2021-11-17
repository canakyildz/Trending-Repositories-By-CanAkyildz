//
//  RepositoryRouter.swift
//  TestApp
//
//  Created by Can Akyıldız on 3.11.2021.
//

import Foundation

enum RepositoryRouter: APIConfiguration {
    case questRepositories
    case questRepositoryDetails
    
    
    // MARK: - HTTPMethod
    
    var method: Method {
        switch self {
        default:
            return .get
        }
    }
    
    // MARK: - Parameters
    
    var params: RequestParams {
        switch self {
        case .questRepositories:
            return .url([:])
        case .questRepositoryDetails:
            return .url([:])
        }
    }
    
    // MARK: - Host
    var host: String {
        switch self {
        case .questRepositories:
            return Constants.APIConstants.searchHost
        case .questRepositoryDetails:
            return Constants.APIConstants.searchHost
        }
    }
    
    // MARK: - Path
    var path: String {
        switch self {
        case .questRepositories:
            return Constants.APIConstants.repositoriesPath
        case .questRepositoryDetails:
            return Constants.APIConstants.repositoriesPath
        }
    }
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .questRepositories:
            return [
                .init(name: "q", value: "q"),
                .init(name: "order", value: "desc"),
                .init(name: "sort", value: "stars"),
            ]
        case .questRepositoryDetails:
            return []
        }
    }
    
    
    // MARK: - Helpers
    
    func asURLRequest() throws -> URLRequest {
        
        
        let url = URL(string: host)
        
        var urlRequest = URLRequest(url: (url?.appendingPathComponent(path))!)
        
        urlRequest.httpMethod = "GET"
        
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        switch params {
            
        case .body(let parameters):
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            
        case .url(_):
            
            var components = URLComponents(url: urlRequest.url!, resolvingAgainstBaseURL: false)!
            
            components.queryItems = queryItems
            
            urlRequest.url = components.url
        }
        return urlRequest
    }
}

