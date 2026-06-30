//
//  WebServiceTest.swift
//  RemoteRecruit
//
//  Created by Alex Antony Vijay J on 16/06/26.
//

import XCTest
@testable import RemoteRecruit

class WebServiceTest: XCTestCase {
    
    var sut: WebService!
    var param: RequestParam!
    
    override func setUp() async throws {
        sut = WebService()
        param = await JobListRequestParam()
    }
    
    override func tearDown() async throws {
        sut = nil
    }
    
    func testWebService_RequestedWithBaseUrl_ShouldReturnError() async {
        let (data, error) = await sut.fetchData(urlString: JobConstant.baseUrl, param: param, type: MockModel.self)
        XCTAssertNil(data, "Data expected to be nil")
        XCTAssertNotNil(error, "Error expected to be not nil")
        XCTAssertTrue(error == .invalidData, "Error expected to be .invalidData")
    }
    
    func testWebService_RequestedWithWrongType_ShouldReturnError() async {
        let (data, error) = await sut.fetchData(urlString: JobConstant.baseUrl, param: param, type: MockModel.self)
        XCTAssertNil(data, "Data expected to be nil")
        XCTAssertNotNil(error, "Error expected to be not nil")
        XCTAssertTrue(error == .invalidData, "Error expected to be .invalidData")
    }
}
