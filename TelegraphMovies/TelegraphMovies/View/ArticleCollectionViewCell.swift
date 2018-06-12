//
//  ArticleCollectionViewCell.swift
//  TelegraphMovies
//
//  Created by Jeevan Thandi on 12/06/2018.
//  Copyright © 2018 Airla Tech Ltd. All rights reserved.
//

import UIKit

final class ArticleCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var articleTitle: UILabel?

    func set(article: Article) {
        articleTitle?.text = article.headline
    }
}
