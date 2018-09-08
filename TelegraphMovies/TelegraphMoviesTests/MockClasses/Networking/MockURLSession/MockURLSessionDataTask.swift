//
//  MockURLSessionDataTask.swift
//  TelegraphMoviesTests
//
//  Created by Jeevan Thandi on 08/09/2018.
//  Copyright © 2018 Airla Tech Ltd. All rights reserved.
//

import Foundation

final class MockURLSessionDataTask: URLSessionDataTask {
    private let dataSet: Data?
    private let urlResponseSet: URLResponse?
    private let errorSet: Error?

    var completionHandler: ((Data?, URLResponse?, Error?) -> Void)?

    init(data: Data?, urlResponse: URLResponse?, error: Error?) {
        self.dataSet = data
        self.urlResponseSet = urlResponse
        self.errorSet = error
    }
    override func resume() {
        DispatchQueue.main.async {
            self.completionHandler?(self.dataSet, self.urlResponseSet, self.errorSet)
        }
    }
}
