//
//  TelegraphArticleListInteractor.swift
//  TelegraphMovies
//
//  Created by Jeevan Thandi on 12/06/2018.
//  Copyright © 2018 Airla Tech Ltd. All rights reserved.
//

import Foundation

final class TelegraphArticleListInteractor: ArticleListInteractor {

    private var callback: ((Result<[Article]>) -> Void)?

    func getArticleList(callback: @escaping (Result<[Article]>) -> Void) {
        self.callback = callback
    }
}
