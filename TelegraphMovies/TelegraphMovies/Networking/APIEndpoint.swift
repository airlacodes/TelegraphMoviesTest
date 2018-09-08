//
//  APIEndpoint.swift
//  TelegraphMovies
//
//  Created by Jeevan Thandi on 30/06/2018.
//  Copyright © 2018 Airla Tech Ltd. All rights reserved.
//

import Foundation

enum APIEndpoint {
    case movieReviewArticles

    var path: String {
        switch self {
        case .movieReviewArticles:
            return "http://s.telegraph.co.uk/tmgmobilepub/articles.json"
        }
    }
}

extension APIEndpoint: Equatable {

    static func ==(lhs: APIEndpoint, rhs: APIEndpoint) -> Bool {
        return lhs.path == rhs.path
    }
}
