//
//  JobDetailWebServiceTest.swift
//  RemoteRecruit
//
//  Created by Alex Antony Vijay J on 16/06/26.
//

import XCTest
@testable import RemoteRecruit

class JobDetailWebServiceTest: XCTestCase {
    var mockWebService: MockWebService!
    var webService: JobDetailWebServiceProtocol!
    var param: JobDetailRequestParam!
    
    override func setUp() async throws {
        mockWebService = MockWebService()
        webService = JobDetailWebService(urlString: JobConstant.baseUrl, webService: mockWebService)
        param = await JobDetailRequestParam()
    }
    
    override func tearDown() async throws {
        mockWebService = nil
        webService = nil
        param = nil
    }
    
    func testJobsWebService_WhenReceivedSuccessData_ShouldReturnCorrectModel() async {
        mockWebService.data = "{\"status\": \"OK\", \"data\": [ {\"job_id\": \"mhw0wA0EwZ6PXXB4AAAAAA==\", \"job_title\": \"Test\", \"employer_name\": \"Loop\", \"job_location\": \"India\", \"job_employment_type\": \"\", \"job_description\": \"\" } ] }".data(using: .utf8)
        let (jobDetail, error) = await webService.fetchJobDetail(param: param)
        XCTAssertNil(error, "Error expected to be nil")
        XCTAssertNotNil(jobDetail, "Job Detail expected not to be nil")
    }
    
    func testJobsWebService_WhenReceivedInCorrectData_ShouldReturnError() async throws {
        mockWebService.data = "".data(using: .utf8)
        let (jobDetail, error) = await webService.fetchJobDetail(param: param)
        XCTAssertNil(jobDetail, "Jobs expected to be nil")
        XCTAssertNotNil(error, "error expected not to be nil")
        XCTAssertEqual(error, JobError.invalidData, "Expected invalid url error")
    }
    
    func testJobsWebService_WhenReceivedWithoutData_ShouldReturnError() async {
        mockWebService.data = "{\"status\": \"OK\" }".data(using: .utf8)
        let (jobDetail, error) = await webService.fetchJobDetail(param: param)
        XCTAssertNil(jobDetail, "Job expected to be nil")
        XCTAssertNotNil(error, "Error expected not to be nil")
        XCTAssertEqual(error, .invalidData, "Jobs count expected to be 1")
    }
}
