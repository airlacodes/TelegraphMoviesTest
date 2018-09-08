//
//  TelegraphScreenFactorySpec.swift
//  TelegraphMoviesTests
//
//  Created by Jeevan Thandi on 08/09/2018.
//  Copyright © 2018 Airla Tech Ltd. All rights reserved.
//

import XCTest
@testable import TelegraphMovies

final class TelegraphScreenFactorySpec: XCTestCase {

    private var testObjet: TelegraphScreenFactory!

    override func setUp() {
        super.setUp()

        testObjet = TelegraphScreenFactory()
    }

    /**
      * When: Creating an ArticleList screen
      * Then: The expected ViewController should be returned
      */
    func testCreateArticleList() {
        let output = testObjet.createArticleList()

        let outputAsExpectedType = output as? ArticleCollectionViewController

        XCTAssertNotNil(outputAsExpectedType)
    }
}
