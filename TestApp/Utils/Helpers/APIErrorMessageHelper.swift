//
//  APIErrorMessageHelper.swift
//  TestApp
//
//  Created by Can Akyıldız on 4.11.2021.
//

import Foundation

class APIErrorMessageHelper {
     
    static let instance = APIErrorMessageHelper()
    
    func returnsAPIErrorMessage(error: APIError) -> String {
        switch error {
        case .noDecoded:
            return "noDecoded_error"
        case .noContent:
            return "noContent_error"
        case .badRequest:
            return "badRequest_error"
        case .unauthorized:
            return "unauthorized_error"
        case .forbidden:
            return "forbidden_error"
        case .notFound:
            return "notFound_error"
        case .noAllowed:
            return "noAllowed_error"
        case .conflict:
            return "conflict_error"
        case .internalServerError:
            return "internalServer_error"
        }
    }
}
