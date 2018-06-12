//
//  TelegraphArticleListPresenter.swift
//  TelegraphMovies
//
//  Created by Jeevan Thandi on 12/06/2018.
//  Copyright © 2018 Airla Tech Ltd. All rights reserved.
//

import Foundation

protocol ArticleListPresenter {

    func set(view: ArticleListView)

    func viewAppeared()
}

final class TelegraphArticleListPresenter: ArticleListPresenter {

    private let articleListInteractor: ArticleListInteractor
    private var view: ArticleListView?

    init(articleListInteractor: ArticleListInteractor) {
        self.articleListInteractor = articleListInteractor
    }

    func set(view: ArticleListView) {
        self.view = view
    }

    func viewAppeared() {
        articleListInteractor.getArticleList(callback: { [weak self] articles in
            self?.view?.set(articles: articles)
        })
    }
}
