//
//  JobDetailRequestParam.swift
//  RemoteRecruit
//
//  Created by Alex Antony Vijay J on 16/06/26.
//

import Foundation

struct JobDetailRequestParam: RequestParam {
    var country: String
    var job_id: String?
    
    init(country: String = JobConstant.defaultCountry) {
        self.country = country
    }
    
    enum CodingKeys: String, CodingKey {
        case country
        case job_id
    }
}
