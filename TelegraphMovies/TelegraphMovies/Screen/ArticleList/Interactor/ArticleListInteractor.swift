//
//  ArticleInteractor.swift
//  TelegraphMovies
//
//  Created by Jeevan Thandi on 12/06/2018.
//  Copyright © 2018 Airla Tech Ltd. All rights reserved.
//

import Foundation

protocol ArticleListInteractor {
    func getArticleList(callback: @escaping CallbackResult<[Article]>)
}
