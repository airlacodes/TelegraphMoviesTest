//
//  MockURLSession.swift
//  TelegraphMoviesTests
//
//  Created by Jeevan Thandi on 08/09/2018.
//  Copyright © 2018 Airla Tech Ltd. All rights reserved.
//

import Foundation

final class MockURLSession: URLSession {

    private var mockURLSessionDataTask: MockURLSessionDataTask?

    func set(mockTask: MockURLSessionDataTask) {
        self.mockURLSessionDataTask = mockTask
    }

    override func dataTask(with url: URL,
                           completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {

        guard let task = mockURLSessionDataTask else {
            fatalError("Mock Task not set on MockURLSession")
        }

        task.completionHandler = completionHandler
        return task
    }
}
