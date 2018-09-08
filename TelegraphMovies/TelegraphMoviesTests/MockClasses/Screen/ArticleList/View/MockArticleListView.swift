//
//  MockArticleListView.swift
//  TelegraphMoviesTests
//
//  Created by Jeevan Thandi on 13/06/2018.
//  Copyright © 2018 Airla Tech Ltd. All rights reserved.
//

import Foundation

@testable import TelegraphMovies

final class MockArticleListView: ArticleListView {

    func set(presenter: ArticleListPresenter) {}

    private(set) var articlesSet: [Article]?
    func set(articles: [Article]) {
        self.articlesSet = articles
    }

    private(set) var errorSet: Error?
    func show(error: Error) {
        self.errorSet = error
    }
}
