//
//  JobDetailResponse.swift
//  RemoteRecruit
//
//  Created by Alex Antony Vijay J on 15/06/26.
//

import Foundation

struct JobDetailResponse: Decodable {
    let data: [JobDetail]
    let status: String 
}
