//
//  ArticleCollection.swift
//  TelegraphMovies
//
//  Created by Jeevan Thandi on 30/06/2018.
//  Copyright © 2018 Airla Tech Ltd. All rights reserved.
//

import Foundation

struct ArticleCollection: Decodable {

    let collection: [Article]

    enum CodingKeys: String, CodingKey {
        case collection = "collection"
    }
}
