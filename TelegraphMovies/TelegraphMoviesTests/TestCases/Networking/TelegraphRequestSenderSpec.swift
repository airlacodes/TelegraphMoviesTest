//
//  TelegraphRequestSenderSpec.swift
//  TelegraphMoviesTests
//
//  Created by Jeevan Thandi on 08/09/2018.
//  Copyright © 2018 Airla Tech Ltd. All rights reserved.
//

import XCTest
@testable import TelegraphMovies

final class TelegraphRequestSenderSpec: XCTestCase {

    private var testObject: TelegraphRequestSender!
    private var mockURLSession: MockURLSession!
    private let requestExpectation = XCTestExpectation(description: "request sender callback holds result")

    override func setUp() {
        super.setUp()
        mockURLSession = MockURLSession()
        testObject = TelegraphRequestSender(urlSession: mockURLSession)
    }

    /**
      * Given: Making a request
      * When: Request succeeds
      * Then: Expected result should be returned
      */
    func testRequestSuccess() {
        let mockSuccessData = MockArticle().set(headline: "mock").build().encode()!

        let mockSuccessDataTask = MockURLSessionDataTask(data: mockSuccessData, urlResponse: nil, error: nil)
        mockURLSession.set(mockTask: mockSuccessDataTask)

        testObject.request(endpoint: .movieReviewArticles, callback: { result in
            XCTAssertEqual(mockSuccessData, result.successValue())
            XCTAssertNil(result.errorValue())
            self.requestExpectation.fulfill()
        })

        wait(for: [requestExpectation], timeout: 1)
    }

    /**
     * Given: Making a request
     * When: Request fails
     * Then: Expected result should be returned
     */
    func testRequestFails() {
        let expectedError = NSError(domain: "some", code: 12, userInfo: nil)
        let mockFailDataTask = MockURLSessionDataTask(data: nil, urlResponse: nil, error: expectedError)
        mockURLSession.set(mockTask: mockFailDataTask)

        testObject.request(endpoint: .movieReviewArticles, callback: {
            XCTAssertEqual(expectedError, $0.errorValue()! as NSError)
            self.requestExpectation.fulfill()
        })

        wait(for: [requestExpectation], timeout: 1)
    }
}
