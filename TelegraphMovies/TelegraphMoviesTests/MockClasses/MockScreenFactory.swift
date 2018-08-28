//
//  MockScreenFactory.swift
//  TelegraphMoviesTests
//
//  Created by Jeevan Thandi on 28/08/2018.
//  Copyright © 2018 Airla Tech Ltd. All rights reserved.
//

import Foundation
import UIKit

@testable import TelegraphMovies

final class MockScreenFactory: ScreenFactory {

    private(set) var createArticleListCalled = false
    func createArticleList() -> UIViewController {
        createArticleListCalled = true
        return UIViewController()
    }
}
