//
//  ScreenFactory.swift
//  TelegraphMovies
//
//  Created by Jeevan Thandi on 30/06/2018.
//  Copyright © 2018 Airla Tech Ltd. All rights reserved.
//

import Foundation
import UIKit

protocol ScreenFactory {

    func createArticleList() -> UIViewController
}

final class TelegraphScreenFactory: ScreenFactory {

    func createArticleList() -> UIViewController {
        let articleListInteractor: ArticleListInteractor = TelegraphArticleListInteractor()
        let articleListPresenter: ArticleListPresenter = TelegraphArticleListPresenter(articleListInteractor: articleListInteractor)

        guard let articleListScreen = UIStoryboard(name: "ArticleList", bundle: nil).instantiateInitialViewController() as? ArticleCollectionViewController else {
            fatalError("Could not instantiate Article List view")
        }

        articleListPresenter.set(view: articleListScreen)
        articleListScreen.set(presenter: articleListPresenter)

        return articleListScreen
    }
}
