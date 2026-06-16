//
//  JobListRequestParam.swift
//  RemoteRecruit
//
//  Created by Alex Antony Vijay J on 16/06/26.
//

import Foundation

final class JobListRequestParam: RequestParam {
    var country: String
    var page: Int
    var num_pages: Int
    var date_posted: String
    var query: String = JobConstant.JobList.defaultQuery
    
    init(country: String = JobConstant.defaultCountry, page: Int = 1, num_pages: Int = 1, date_posted: String = "all") {
        self.country = country
        self.page = page
        self.num_pages = num_pages
        self.date_posted = date_posted
    }
    
    enum CodingKeys: String, CodingKey {
        case country
        case page
        case num_pages
        case date_posted
        case query
    }
    
    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.country = try container.decode(String.self, forKey: .country)
        self.page = try container.decode(Int.self, forKey: .page)
        self.num_pages = try container.decode(Int.self, forKey: .num_pages)
        self.date_posted = try container.decode(String.self, forKey: .date_posted)
        self.query = try container.decode(String.self, forKey: .query)
    }
}
