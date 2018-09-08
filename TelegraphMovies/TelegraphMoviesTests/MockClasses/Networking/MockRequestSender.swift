//
//  MockRequestSender.swift
//  TelegraphMoviesTests
//
//  Created by Jeevan Thandi on 08/09/2018.
//  Copyright © 2018 Airla Tech Ltd. All rights reserved.
//

import Foundation
@testable import TelegraphMovies

final class MockRequestSender: RequestSender {

    private(set) var endpointSet: APIEndpoint?
    private(set) var requestCalled = false
    private var callbackSet: CallbackResult<Data>?
    func request(endpoint: APIEndpoint, callback: @escaping CallbackResult<Data>) {
        self.endpointSet = endpoint
        self.callbackSet = callback
        requestCalled = true
    }

    func triggerRequstResult(_ result: Result<Data>) {
        self.callbackSet?(result)
    }
}
