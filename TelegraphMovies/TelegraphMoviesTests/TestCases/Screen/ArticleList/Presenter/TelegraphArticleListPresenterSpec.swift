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
    private var mockArticleListInteractor: MockArticleListInteractor!
    private var mockArticleListView: MockArticleListView!

    override func setUp() {
        super.setUp()
        mockArticleListInteractor = MockArticleListInteractor()
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
        XCTFail()
    }
    
}
