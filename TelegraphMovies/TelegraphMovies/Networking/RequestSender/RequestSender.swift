//
//  RequestSender.swift
//  TelegraphMovies
//
//  Created by Jeevan Thandi on 30/06/2018.
//  Copyright © 2018 Airla Tech Ltd. All rights reserved.
//

import Foundation

protocol RequestSender {
    func request(endpoint: APIEndpoint, callback: @escaping CallbackResult<Data>)
}



