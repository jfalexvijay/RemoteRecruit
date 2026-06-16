//
//  WebServiceProtocol.swift
//  RemoteRecruit
//
//  Created by Alex Antony Vijay J on 16/06/26.
//

import Foundation

protocol WebServiceProtocol {
    func fetchData<T: Decodable>(urlString: String, urlSession: URLSession, param: RequestParam, type: T.Type) async -> (T?, JobError?)
}
