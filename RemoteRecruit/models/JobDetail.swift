//
//  JobDetail.swift
//  RemoteRecruit
//
//  Created by Alex Antony Vijay J on 15/06/26.
//

import Foundation

struct JobDetail: Decodable {
    let id: String
    let title: String
    let employerName: String
    let jobType: String
    let jobDescription: String
    let jobPostedAt: String?
    let jobLocation: String?
    let industry: String?
    let skills: [String]?
    
    enum CodingKeys: String, CodingKey {
        case id = "job_id"
        case title = "job_title"
        case employerName = "employer_name"
        case jobType = "job_employment_type"
        case jobDescription = "job_description"
        case jobPostedAt = "job_posted_at"
        case jobLocation = "job_location"
        case industry
        case skills = "required_technologies"
    }
}
