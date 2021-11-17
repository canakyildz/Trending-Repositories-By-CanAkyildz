//
//  JSONCoding.swift
//  TestApp
//
//  Created by Can Akyıldız on 6.11.2021.
//

import Foundation

class CustomDecoder: JSONDecoder {
    override init() {
        super.init()
        keyDecodingStrategy = .convertFromSnakeCase
    }
}

class CustomEncoder: JSONEncoder {
    override init() {
        super.init()
        keyEncodingStrategy = .convertToSnakeCase
    }
}
