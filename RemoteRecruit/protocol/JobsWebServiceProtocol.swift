//
//  JobsWebServiceProtocol.swift
//  RemoteRecruit
//
//  Created by Alex Antony Vijay J on 15/06/26.
//

protocol JobListWebServiceProtocol {
    func fetchJobs(param: JobListRequestParam) async -> ([Jobs]?, JobError?)
}
