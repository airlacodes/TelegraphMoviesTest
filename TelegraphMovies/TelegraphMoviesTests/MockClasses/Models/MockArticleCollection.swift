//
//  MockArticleCollection.swift
//  TelegraphMoviesTests
//
//  Created by Jeevan Thandi on 08/09/2018.
//  Copyright © 2018 Airla Tech Ltd. All rights reserved.
//

@testable import TelegraphMovies

final class MockArticleCollection {

    private var articleCollection: ArticleCollection

    init() {
        articleCollection = ArticleCollection()
    }

    func set(collection: [Article]) -> MockArticleCollection {
        create(collection: collection)
        return self
    }

    func build() -> ArticleCollection {
        return articleCollection
    }
    
    private func create(collection: [Article]) {
        self.articleCollection = ArticleCollection(collection: articleCollection.collection.isEmpty ? collection : articleCollection.collection)
    }
}
