//
//  MainFlowSpec.swift
//  TelegraphMoviesTests
//
//  Created by Jeevan Thandi on 28/08/2018.
//  Copyright © 2018 Airla Tech Ltd. All rights reserved.
//

import Foundation
import XCTest

@testable import TelegraphMovies

final class MainFlowSpec: XCTestCase {

    private var testObject: MainFlow!
    private var mockScreenFactory: MockScreenFactory!
    private let mockUIWindow = MockUIWindow()

    override func setUp() {
        super.setUp()
        mockScreenFactory = MockScreenFactory()
        testObject = MainFlow(window: mockUIWindow, screenFactory: mockScreenFactory)
    }

    /**
      * When: MainFlow starts
      * Then: Screen factory should create the article list
      * And: Root view controller should be set on the UIWindow
      */
    func testMainFlowStart() {
        testObject.start()

        XCTAssertTrue(mockScreenFactory.createArticleListCalled)
        XCTAssertNotNil(mockUIWindow.rootViewControllerSet)
    }
}

private final class MockUIWindow: UIWindow {

    private(set) var rootViewControllerSet: UIViewController?
    override var rootViewController: UIViewController? {
        didSet {
            self.rootViewControllerSet = rootViewController
        }
    }
}
