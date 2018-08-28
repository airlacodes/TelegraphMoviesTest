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
    @IBOutlet private weak var articleImage: UIImageView?
    @IBOutlet private weak var articleDescription: UILabel?

    func set(article: Article) {
        articleTitle?.text = article.headline
        articleImage?.downloadImageFromUrl(article.pictureUrl)
        articleDescription?.text = article.description
    }

    override func prepareForReuse() {
        articleImage?.image = nil
        articleTitle?.text = nil
    }
}
