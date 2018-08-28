//
//  MockArticleListInteractor.swift
//  TelegraphMoviesTests
//
//  Created by Jeevan Thandi on 13/06/2018.
//  Copyright © 2018 Airla Tech Ltd. All rights reserved.
//

import Foundation

@testable import TelegraphMovies

final class MockArticleListInteractor: ArticleListInteractor {

    private(set) var getArticleListCalled = false
    func getArticleList(callback: @escaping (Result<[Article]>) -> Void) {
        getArticleListCalled = true
    }
}
