//
//  Job.swift
//  RemoteRecruit
//
//  Created by Alex Antony Vijay J on 15/06/26.
//

import Foundation

struct Jobs: Decodable, Identifiable, Hashable {
    let id: String
    let title: String
    let companyName: String
    let jobLocation: String
    
    enum CodingKeys: String, CodingKey {
        case id = "job_id"
        case title = "job_title"
        case companyName = "employer_name"
        case jobLocation = "job_location"
    }
}

//struct Owner: Decodable, Hashable {
//    let companyName: String
//    let photo: String
//    let funding: String
//    let locationAddress: String
//    let sector: String
//    let teamSize: Int
//}
