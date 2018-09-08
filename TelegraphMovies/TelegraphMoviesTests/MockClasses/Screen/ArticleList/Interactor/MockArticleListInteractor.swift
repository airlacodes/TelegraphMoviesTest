//
//  MockArticleListInteractor.swift
//  TelegraphMoviesTests
//
//  Created by Jeevan Thandi on 13/06/2018.
//  Copyright © 2018 Airla Tech Ltd. All rights reserved.
//

import Foundation

@testable import TelegraphMovies

final class MockockArticleListInteractor: ArticleListInteractor {

    private(set) var getArticleListCalled = false
    private var getArticleListCallback: CallbackResult<[Article]>?
    func getArticleList(callback: @escaping (Result<[Article]>) -> Void) {
        self.getArticleListCallback = callback
        getArticleListCalled = true
    }

    func triggerGetArticleListResult(_ result: Result<[Article]>) {
        self.getArticleListCallback?(result)
    }
}
