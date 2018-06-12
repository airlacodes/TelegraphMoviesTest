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

    func set(articles: [Article]) {}

    func show(error: Error) {}
}
