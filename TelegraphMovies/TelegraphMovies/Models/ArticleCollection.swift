//
//  ArticleCollection.swift
//  TelegraphMovies
//
//  Created by Jeevan Thandi on 30/06/2018.
//  Copyright © 2018 Airla Tech Ltd. All rights reserved.
//

import Foundation

struct ArticleCollection: CodableModel {

    let collection: [Article]

    enum CodingKeys: String, CodingKey {
        case collection = "collection"
    }

    init(collection: [Article] = []) {
        self.collection = collection
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.collection = (try? container.decode([Article].self, forKey: .collection)) ?? [Article()]
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(collection, forKey: .collection)
    }
}
