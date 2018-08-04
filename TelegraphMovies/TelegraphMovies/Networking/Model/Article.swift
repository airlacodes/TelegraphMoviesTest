//
//  Article.swift
//  TelegraphMovies
//
//  Created by Jeevan Thandi on 12/06/2018.
//  Copyright © 2018 Airla Tech Ltd. All rights reserved.
//

import Foundation

struct Article: Decodable {

    let headline: String
    let description: String
    let pictureUrl: String

    enum CodingKeys: String, CodingKey {
        case headline = "headline"
        case description = "description"
        case pictureUrl = "picture-url"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.headline = (try? container.decode(String.self, forKey: .headline)) ?? ""
        self.description = (try? container.decode(String.self, forKey: .description)) ?? ""
        self.pictureUrl = (try? container.decode(String.self, forKey: .pictureUrl)) ?? ""
    }
}

/**
 {
 "id": 1,
 "website-url": "http://www.telegraph.co.uk/film/the-revenant/",
 "headline": "The revenant",
 "description": "Leo's beautiful endurance test",
 "article-body": "",
 "ratings": 4,
 "picture-url": "http://www.telegraph.co.uk/content/dam/film/the revenant/leo-xlarge.jpg",
 "video-url": "",
 "actors": [
 "Leonardo DiCaprio",
 "Tom Hardy",
 "Domhnall Gleeson",
 "Will Poulter"
 ],
 "director": "Alejandro G. Iñárritu",
 "genre": [
 "Action",
 "Drama"
 ],
 "synopsis": "In the 1820s, a frontiersman, Hugh Glass, sets out on a path of vengeance against those who left him for dead after a bear mauling",
 "release-date": "15-01-2015",
 "duration": "156 mins",
 "published-date": "14 January 2016 • 12:00pm",
 "author": {
 "name": "Robbie Collin",
 "headshot": "http://www.telegraph.co.uk/content/dam/film/team/robbie-collin-byline0-USE-small.jpg",
 "twitter": "@robbiereviews"
 }
 }
 */
