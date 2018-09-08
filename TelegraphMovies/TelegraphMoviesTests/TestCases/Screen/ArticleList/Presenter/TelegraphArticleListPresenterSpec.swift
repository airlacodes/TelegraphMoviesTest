//
//  TelegraphArticleListPresenterSpec.swift
//  TelegraphMoviesTests
//
//  Created by Jeevan Thandi on 12/06/2018.
//  Copyright © 2018 Airla Tech Ltd. All rights reserved.
//

import XCTest

@testable import TelegraphMovies

final class TelegraphArticleListPresenterSpec: XCTestCase {

    private var testObject: TelegraphArticleListPresenter!
    private var mockArticleListInteractor: MockockArticleListInteractor!
    private var mockArticleListView: MockArticleListView!

    override func setUp() {
        super.setUp()
        mockArticleListInteractor = MockockArticleListInteractor()
        mockArticleListView = MockArticleListView()

        testObject = TelegraphArticleListPresenter(articleListInteractor: mockArticleListInteractor)
        testObject.set(view: mockArticleListView)
    }

    /**
      * When: View appears
      * Then: Interactor should be called to get article list
      */
    func testViewAppears() {
        testObject.viewAppeared()

        XCTAssertTrue(mockArticleListInteractor.getArticleListCalled)
    }

    /**
      * Given: View appears
      * When: getting article list succeeds
      * Then: View should be set with expected articles
      */
    func testGetArticleListSucceeds() {
        testObject.viewAppeared()

        let mockArticleList = [MockArticle().set(headline: "mock").build()]
        mockArticleListInteractor.triggerGetArticleListResult(.success(mockArticleList))

        XCTAssertEqual("mock", mockArticleListView.articlesSet![0].headline)
    }

    /**
     * Given: View appears
     * When: getting article list fails
     * Then: View should be passed the error
     */
    func testGetArticleListFails() {
        testObject.viewAppeared()

        let error = NSError(domain: "some", code: 12, userInfo: nil)
        mockArticleListInteractor.triggerGetArticleListResult(.failure(error))

        XCTAssertEqual(error, mockArticleListView.errorSet! as NSError)
    }
}
