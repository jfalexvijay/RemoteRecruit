//
//  JobsWebServiceTest.swift
//  RemoteRecruit
//
//  Created by Alex Antony Vijay J on 15/06/26.
//

import XCTest
@testable import RemoteRecruit

class JobsWebServiceTest: XCTestCase {
    var mockWebService: MockWebService!
    var webService: JobListWebServiceProtocol!
    var param: JobListRequestParam!
    
    override func setUp() async throws {
        mockWebService = MockWebService()
        webService = JobsWebService(urlString: JobConstant.baseUrl, webService: mockWebService)
        param = JobListRequestParam()
    }
    
    override func tearDown() async throws {
        mockWebService = nil
        webService = nil
        param = nil
    }
    
    func testJobsWebService_WhenReceivedSuccessData_ShouldReturnCorrectModel() async {
        mockWebService.data = "{\"status\": \"OK\", \"data\": [ {\"job_id\": \"mhw0wA0EwZ6PXXB4AAAAAA==\", \"job_title\": \"Test\", \"employer_name\": \"Loop\", \"job_location\": \"India\" } ] }".data(using: .utf8)
        let (jobs, error) = await webService.fetchJobs(param: param)
        XCTAssertNil(error, "Error expected to be nil")
        XCTAssertNotNil(jobs, "Jobs expected not to be nil")
        XCTAssertEqual(jobs?.count, 1, "Jobs count expected to be 1")
    }
    
    func testJobsWebService_WhenReceivedInCorrectData_ShouldReturnError() async throws {
        mockWebService.data = "".data(using: .utf8)
        let (jobs, error) = await webService.fetchJobs(param: param)
        XCTAssertNil(jobs, "Jobs expected to be nil")
        XCTAssertNotNil(error, "error expected not to be nil")
        XCTAssertEqual(error, JobError.invalidData, "Expected invalid url error")
    }
    
    func testJobsWebService_WhenReceivedWithoutData_ShouldReturnError() async {
        mockWebService.data = "{\"status\": \"OK\" }".data(using: .utf8)
        let (jobs, error) = await webService.fetchJobs(param: param)
        XCTAssertNil(jobs, "Job expected to be nil")
        XCTAssertNotNil(error, "Error expected not to be nil")
        XCTAssertEqual(error, .invalidData, "Jobs count expected to be 1")
    }
}
