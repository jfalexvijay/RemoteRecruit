//
//  TestJobListViewModel.swift
//  RemoteRecruit
//
//  Created by Alex Antony Vijay J on 15/06/26.
//

import XCTest
@testable import RemoteRecruit

class JobListViewModelTest: XCTestCase {
    var mockWebService: MockWebService!
    var sut: JobListViewModel!
    var param: JobListRequestParam!
    
    override func setUp() async throws {
        mockWebService = MockWebService()
        let webService = JobsWebService(urlString: JobConstant.baseUrl, webService: mockWebService)
        sut = await JobListViewModel(webService: webService)
        param = JobListRequestParam()
    }
    
    override func tearDown() async throws {
        mockWebService = nil
        sut = nil
        param = nil
    }
    
    func testJobListViewModel_JobListLoaded_JobListCountShouldBeAtleaseOne() async {
        mockWebService.data = "{\"status\": \"OK\", \"data\": [ {\"job_id\": \"mhw0wA0EwZ6PXXB4AAAAAA==\", \"job_title\": \"Test\", \"employer_name\": \"Loop\", \"job_location\": \"India\" } ] }".data(using: .utf8)
        await sut.fetchJobList()
        let jobs = await sut.jobs
        XCTAssertNotNil(jobs, "Jobs expected to be not nil")
        XCTAssertGreaterThan(jobs.count, 0, "Jobs count expected to be more than 0")
    }
    
    func testJobListViewModel_JobListLoadedWithError_JobListCountShouldBeZero() async {
        mockWebService.data = "{\"status\": \"OK\" }".data(using: .utf8)
        await sut.fetchJobList()
        let jobs = await sut.jobs
        XCTAssertNotNil(jobs, "Jobs expected to be not nil")
        XCTAssertEqual(jobs.count, 0, "Jobs count expected to be 0")
    }
}
