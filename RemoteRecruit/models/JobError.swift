//
//  JobsError.swift
//  RemoteRecruit
//
//  Created by Alex Antony Vijay J on 15/06/26.
//

import Foundation

enum JobError: Error {
    case invalidRequest
    case invalidUrl
    case networkError
    case invalidData
}

extension JobError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidRequest:
            return "Your request failed. Please contact our support team"
        case .invalidUrl:
            return "Your request failed. Please contact our support team"
        case .networkError:
            return "Please check your network and try again"
        case .invalidData:
            return "Your request failed. Please contact our support team"
        }
    }
}
