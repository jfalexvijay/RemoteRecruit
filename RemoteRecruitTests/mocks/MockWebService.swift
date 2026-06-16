//
//  MockWebService.swift
//  RemoteRecruit
//
//  Created by Alex Antony Vijay J on 16/06/26.
//

import Foundation
@testable import RemoteRecruit

class MockWebService: WebServiceProtocol {
    
    var data: Data?
    
    func fetchData<T>(urlString: String, urlSession: URLSession, param: RequestParam, type: T.Type) async -> (T?, JobError?) where T : Decodable {
        do {
            let data = try JSONDecoder().decode(type, from: data ?? Data())
            return (data, nil)
        } catch {
            return (nil, .invalidData)
        }
    }
}
