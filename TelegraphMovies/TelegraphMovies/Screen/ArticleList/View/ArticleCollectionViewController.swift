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

    private let cellReuseIdentifier = "article"
    private var articles: [Article]?
    private var presenter: ArticleListPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.dataSource = self
        self.collectionView?.delegate = self

        presenter?.viewAppeared()
    }

    func set(articles: [Article]) {
        self.articles = articles

        DispatchQueue.main.async{
            self.collectionView?.reloadData()
        }
    }

    func set(presenter: ArticleListPresenter) {
        self.presenter = presenter
    }

    func show(error: Error) {
        print(error.localizedDescription)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles?.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.collectionView?.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier,
                                                                  for: indexPath) as? ArticleCollectionViewCell else {
                                                                    fatalError("Could not instantiate cell for ArticleCollectionViewController")
        }

        if let article = self.articles?[indexPath.row] {
            cell.set(article: article)
        }

        return cell
    }
}
