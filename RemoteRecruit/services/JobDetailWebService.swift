//
//  JobDetailWebService.swift
//  RemoteRecruit
//
//  Created by Alex Antony Vijay J on 16/06/26.
//

import Foundation

nonisolated final class JobDetailWebService: JobDetailWebServiceProtocol {
    private let urlString: String
    private let urlSession: URLSession
    private let webService: WebServiceProtocol
    
    init(urlString: String, urlSession: URLSession = .shared, webService: WebServiceProtocol = WebService()) {
        self.urlString = urlString
        self.urlSession = urlSession
        self.webService = webService
    }
    
    func fetchJobDetail(param: JobDetailRequestParam) async -> (JobDetail?, JobError?) {
        let (responseData, error) = await webService.fetchData(urlString: urlString, urlSession: urlSession, param: param, type: JobDetailResponse.self)
        if let responseData = responseData {
            return (responseData.data[0], error)
        }
        return (nil, error)
    }
}
