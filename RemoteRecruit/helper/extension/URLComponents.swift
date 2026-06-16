//
//  URLComponents.swift
//  RemoteRecruit
//
//  Created by Alex Antony Vijay J on 15/06/26.
//

import Foundation

extension URLComponents {
    nonisolated mutating func setQueryItems<T: Codable>(from model: T) {
        guard let dictionary = model.asDictionary() else { return }
        
        // Map dictionary keys and stringified values to URLQueryItems
        self.queryItems = dictionary.compactMap { (key, value) in
            // Handle optional values gracefully
            let stringValue = "\(value)"
            return URLQueryItem(name: key, value: stringValue)
        }
    }
}
