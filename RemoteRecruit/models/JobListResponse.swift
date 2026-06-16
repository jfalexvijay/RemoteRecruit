//
//  ApiResponse.swift
//  RemoteRecruit
//
//  Created by Alex Antony Vijay J on 15/06/26.
//

import Foundation

struct JobListResponse: Decodable {
    let status: String
    var data: [Jobs]
}

struct Result: Decodable {
    let jobs: [Jobs]
}
