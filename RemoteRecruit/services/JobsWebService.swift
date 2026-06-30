//
//  JobsWebService.swift
//  RemoteRecruit
//
//  Created by Alex Antony Vijay J on 15/06/26.
//

import Foundation

nonisolated final class JobsWebService: JobListWebServiceProtocol {
    private let urlString: String
    private let urlSession: URLSession
    private let webService: WebServiceProtocol
    
    init(urlString: String, urlSession: URLSession = .shared, webService: WebServiceProtocol = WebService()) {
        self.urlString = urlString
        self.urlSession = urlSession
        self.webService = webService
    }
    
    func fetchJobs(param: JobListRequestParam) async -> ([Jobs]?, JobError?) {
        let (responseData, error) = await webService.fetchData(urlString: urlString, urlSession: urlSession, param: param, type: JobListResponse.self)
        if let responseData = responseData {
            return (responseData.data, error)
        }
        return (nil, error)
    }
}
