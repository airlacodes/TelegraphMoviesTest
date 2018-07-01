//
//  String+URL.swift
//  TelegraphMovies
//
//  Created by Jeevan Thandi on 01/07/2018.
//  Copyright © 2018 Airla Tech Ltd. All rights reserved.
//

import Foundation

extension String {
    func asUrl() -> URL {

        guard let url = URL(string: self) else {
            fatalError("Invalid URL")
        }

        return url
    }
}
