//
//  MockArticle.swift
//  TelegraphMoviesTests
//
//  Created by Jeevan Thandi on 08/09/2018.
//  Copyright © 2018 Airla Tech Ltd. All rights reserved.
//

import Foundation
@testable import TelegraphMovies

class MockArticle {

    private var article: Article

    init() {
        self.article = Article()
    }

    func build() -> Article {
        return article
    }

    func set(headline: String) -> MockArticle {
        create(headline: headline)
        return self
    }

    private func create(headline: String = "") {
        article = Article(headline: article.headline.isEmpty ? headline : article.headline)
    }

}
