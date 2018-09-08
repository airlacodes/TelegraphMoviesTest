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
      * Given: Getting article list
      * Then: Expected endpoint should be set
      * When: Request sender succeeds
      * Then: Expected result should be propogated to callback
      */
    func testGetArticleList() {
        var result: Result<[Article]>?
        testObject.getArticleList(callback: { result = $0 })

        XCTAssertEqual(.movieReviewArticles, mockRequestSender.endpointSet)

        let expectedRequestResult = MockArticleCollection().set(collection: [MockArticle().set(headline: "mock").build()]).build()

        mockRequestSender.triggerRequstResult(Result.success(expectedRequestResult.encode()!))

        XCTAssertEqual("mock", result?.successValue()![0].headline)
    }
}
