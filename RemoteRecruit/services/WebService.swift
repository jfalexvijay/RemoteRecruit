//
//  WebService.swift
//  RemoteRecruit
//
//  Created by Alex Antony Vijay J on 16/06/26.
//

import Foundation

nonisolated final class WebService: WebServiceProtocol {
    
    func fetchData<T: Decodable>(urlString: String, urlSession: URLSession = .shared, param: RequestParam, type: T.Type) async -> (T?, JobError?) {
        var component = URLComponents(string: urlString)
        component?.setQueryItems(from: param)
        guard let url = component?.url else {
            return (nil, JobError.invalidUrl)
        }
        let request = getRequest(url: url)
        do {
            let (data, _) = try await urlSession.data(for: request)
            let api = try JSONDecoder().decode(type.self, from: data)
            return (api, nil)
        } catch (let error) {
            if error is DecodingError {
                return (nil, JobError.invalidData)
            } else {
                return (nil, JobError.networkError)
            }
        }
    }
    
    func getRequest(url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("x-rapidapi-host", forHTTPHeaderField: "jsearch.p.rapidapi.com")
        request.addValue(JobConstant.apiHeaderValue, forHTTPHeaderField: JobConstant.apiHeaderKey)
        return request
    }
}
