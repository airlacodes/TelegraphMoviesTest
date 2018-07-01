//
//  TelegraphArticleListInteractor.swift
//  TelegraphMovies
//
//  Created by Jeevan Thandi on 12/06/2018.
//  Copyright © 2018 Airla Tech Ltd. All rights reserved.
//

import Foundation

final class TelegraphArticleListInteractor: ArticleListInteractor {

    private let requestSender: RequestSender
    private var callback: ((Result<[Article]>) -> Void)?

    init(requestSender: RequestSender = TelegraphRequestSender()) {
        self.requestSender = requestSender
    }

    func getArticleList(callback: @escaping (Result<[Article]>) -> Void) {
        self.callback = callback

        requestSender.request(endpoint: .movieReviewArticles,
                              callback: { [weak self] result in
                                switch result {
                                case .success(let data):
                                    self?.handleSuccess(data: data)
                                case .failure(let error):
                                    self?.handleFail(error: error)
                                }
        })
    }

    private func handleSuccess(data: Data) {
        guard let articleCollection = data.decode(ofType: ArticleCollection.self) else {
            handleFail(error: APIError.invalidJson)
            return
        }

        callback?(.success(articleCollection.collection))
    }

    private func handleFail(error: Error) {
        callback?(.failure(error))
    }
}
