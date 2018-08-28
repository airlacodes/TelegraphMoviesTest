//
//  UIImageView+Download.swift
//  TelegraphMovies
//
//  Created by Jeevan Thandi on 28/08/2018.
//  Copyright © 2018 Airla Tech Ltd. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {

    func downloadImageFromUrl(_ url: String,
                              defaultImage: UIImage? = nil) {
        guard let url = URL(string: url) else {
            return
        }

        URLSession.shared.dataTask(with: url, completionHandler: { [weak self] (data, response, error) -> Void in
            guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else {
                    return
            }
            DispatchQueue.main.async{
                self?.image = image
            }
        }).resume()
    }
}
