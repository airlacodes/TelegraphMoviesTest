//
//  TelegraphRequestSender.swift
//  TelegraphMovies
//
//  Created by Jeevan Thandi on 30/06/2018.
//  Copyright © 2018 Airla Tech Ltd. All rights reserved.
//

import Foundation

final class TelegraphRequestSender: RequestSender {

    private let urlSession: URLSession

    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }

    func request(endpoint: APIEndpoint, callback: @escaping (Result<Data>) -> Void) {
        let task = urlSession.dataTask(with: endpoint.path.asUrl(),
                                       completionHandler: { (data, response, error) in
                                        if let error = error {
                                            callback(.failure(error))
                                        } else if let data = data {
                                            callback(.success(data))
                                        } else {
                                            callback(.failure(APIError.unkownError))
                                        }
        })
        task.resume()
    }
}
