//
//  MBNetworkingTests.swift
//  MBNetworkingTests
//
//  Created by Alessadro Viviani on 17/05/2019.
//  Copyright © 2019 Alessadro Viviani. All rights reserved.
//

import XCTest
@testable import MBNetworking

class MBNetworkingTests: XCTestCase {
    let url = "https://www.apple.com/newsroom/rss-feed.rss"
    let method: HTTPMethod = .get
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        super.tearDown()
        
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        let promise = XCTestExpectation(description: "Status code = 200")
        
        var statusCode: Int = 0
        var error: Error?
        
        MBNetworking.request(withUrl: url, method: method, headers: nil, parameters: nil, encoding: URLParameterEncoder.queryItems) { response in
            error = response.error
            
            if let responseStatusCode = response.response?.statusCode {
                statusCode = responseStatusCode
            }
            promise.fulfill()
        }
        
        wait(for: [promise], timeout: 10)
        
        XCTAssertNil(error)
        XCTAssertEqual(statusCode, 200)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
