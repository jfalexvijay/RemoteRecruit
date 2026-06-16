//
//  JobDetailRequestParam.swift
//  RemoteRecruit
//
//  Created by Alex Antony Vijay J on 16/06/26.
//

import Foundation

final class JobDetailRequestParam: RequestParam {
    var country: String
    var job_id: String?
    
    init(country: String = JobConstant.defaultCountry) {
        self.country = country
    }
    
    enum CodingKeys: String, CodingKey {
        case country
        case job_id
    }
    
    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.country = try container.decode(String.self, forKey: .country)
        self.job_id = try container.decode(String.self, forKey: .job_id)
    }
}
