//
//  JobDetailsViewModelTest.swift
//  RemoteRecruit
//
//  Created by Alex Antony Vijay J on 16/06/26.
//

import XCTest
@testable import RemoteRecruit

class JobDetailsViewModelTest: XCTestCase {
    var mockWebService: MockWebService!
    var sut: JobDetailsViewModel!
    var param: JobDetailRequestParam!
    
    override func setUp() async throws {
        mockWebService = MockWebService()
        let webService = JobDetailWebService(urlString: JobConstant.baseUrl, webService: mockWebService)
        sut = await JobDetailsViewModel(webService: webService, jobId: "11")
        param = JobDetailRequestParam()
    }
    
    override func tearDown() async throws {
        mockWebService = nil
        sut = nil
        param = nil
    }
    
    func testJobListViewModel_JobDetailLoaded_ShouldReturnJobDetail() async {
        mockWebService.data = "{\"status\": \"OK\", \"data\": [ {\"job_id\": \"mhw0wA0EwZ6PXXB4AAAAAA==\", \"job_title\": \"Test\", \"employer_name\": \"Loop\", \"job_location\": \"India\", \"job_employment_type\": \"\", \"job_description\": \"\" } ] }".data(using: .utf8)
        await sut.fetchJobDetails()
        let jobDetail = await sut.jobDetail
        XCTAssertNotNil(jobDetail, "Job detail expected to be not nil")
    }
    
    func testJobListViewModel_JobDetailFailedToLoad_JobDetailShouldBeNil() async {
        mockWebService.data = "{\"status\": \"OK\" }".data(using: .utf8)
        await sut.fetchJobDetails()
        let jobDetail = await sut.jobDetail
        XCTAssertNil(jobDetail, "Job detail expected to be nil")
    }
}
