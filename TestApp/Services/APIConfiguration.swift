//
//  APIConfiguration.swift
//  TestApp
//
//  Created by Can Akyıldız on 3.11.2021.
//

import Foundation

protocol APIConfiguration {
    
    var method: Method { get }
    var params: RequestParams { get }
}

enum HTTPHeaderField: String {
    
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "accept"
    case acceptEncoding = "Accept-Encoding"
    case string = "String"
}

enum ContentType: String {
    
    case json = "application/json"
    case formEncode = "application/x-www-form-urlencoded"
}

enum Method: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum RequestParams {
    
    case body(_:[String:Any])
    case url(_:[String:Any])
}


enum APIError: Error {
    case noDecoded
    case noContent
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case noAllowed
    case conflict
    case internalServerError
}
