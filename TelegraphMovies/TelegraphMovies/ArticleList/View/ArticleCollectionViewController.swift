//
//  ArticleCollectionView.swift
//  TelegraphMovies
//
//  Created by Jeevan Thandi on 12/06/2018.
//  Copyright © 2018 Airla Tech Ltd. All rights reserved.
//

import Foundation
import UIKit

final class ArticleCollectionViewController: UICollectionViewController, ArticleListView {

    private var articles: [Article]?
    private var presenter: ArticleListPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewAppeared()
    }

    func set(articles: [Article]) {
        self.articles = articles
        self.collectionView?.reloadData()
    }

    func set(presenter: ArticleListPresenter) {
        self.presenter = presenter
    }

    func show(error: Error) {
        print(error.localizedDescription)
    }

    func numberOfItems(inSection section: Int) -> Int {
        return articles?.count ?? 0
    }

    func cellForItem(at indexPath: IndexPath) -> UICollectionViewCell? {
        let cell = self.collectionView?.dequeueReusableCell(withReuseIdentifier: "ArticleCollectionViewCell",
                                                            for: indexPath) as! ArticleCollectionViewCell

        if let article = self.articles?[indexPath.row] {
            cell.set(article: article)
        }

        return cell
    }
}
