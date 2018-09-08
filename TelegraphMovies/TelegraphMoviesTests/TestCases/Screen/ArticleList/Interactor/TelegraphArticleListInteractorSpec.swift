//
//  TelegraphArticleListInteractorSpec.swift
//  TelegraphMoviesTests
//
//  Created by Jeevan Thandi on 12/06/2018.
//  Copyright © 2018 Airla Tech Ltd. All rights reserved.
//

import XCTest
@testable import TelegraphMovies

final class TelegraphArticleListInteractorSpec: XCTestCase {

    private var testObject: TelegraphArticleListInteractor!
    private var mockRequestSender: MockRequestSender!

    override func setUp() {
        super.setUp()
        mockRequestSender = MockRequestSender()
        testObject = TelegraphArticleListInteractor(requestSender: mockRequestSender)
    }

    /**
      * When: Getting article list
      * Then: Request sender should be called
      * Then: Expected endpoint should be set
      */
    func testGetArticleList() {
        testObject.getArticleList(callback: { _ in})
        XCTAssertEqual(.movieReviewArticles, mockRequestSender.endpointSet)
        XCTAssertTrue(mockRequestSender.requestCalled)
    }

    /**
     * Given: Getting article list
     * When: Request sender succeeds
     * Then: Expected result should be propogated to callback
     */
    func testGetArticleListSuccess() {
        var result: Result<[Article]>?
        testObject.getArticleList(callback: { result = $0 })

        XCTAssertEqual(.movieReviewArticles, mockRequestSender.endpointSet)

        let expectedRequestResult = MockArticleCollection().set(collection: [MockArticle().set(headline: "mock").build()]).build()

        mockRequestSender.triggerRequstResult(Result.success(expectedRequestResult.encode()!))

        XCTAssertEqual("mock", result?.successValue()![0].headline)
    }

    /**
     * Given: Getting article list
     * When: Request sender fails
     * Then: Expected result should be propogated to callback
     */
    func testGetArticleListFail() {
        var result: Result<[Article]>?
        testObject.getArticleList(callback: { result = $0 })

        let expectedRequestResult = NSError(domain: "some", code: 12, userInfo: nil)

        mockRequestSender.triggerRequstResult(Result.failure(expectedRequestResult))

        XCTAssertEqual(expectedRequestResult, result!.errorValue()! as NSError)
    }
}
