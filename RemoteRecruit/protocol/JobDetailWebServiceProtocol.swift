//
//  JobDetailWebServiceProtocol.swift
//  RemoteRecruit
//
//  Created by Alex Antony Vijay J on 15/06/26.
//

import Foundation

protocol JobDetailWebServiceProtocol {
    func fetchJobDetail(param: JobDetailRequestParam) async -> (JobDetail?, JobError?)
}
