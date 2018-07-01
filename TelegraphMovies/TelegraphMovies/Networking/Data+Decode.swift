//
//  Data+Decodable.swift
//  TelegraphMovies
//
//  Created by Jeevan Thandi on 30/06/2018.
//  Copyright © 2018 Airla Tech Ltd. All rights reserved.
//

import Foundation

extension Data {
    func decode<T: Decodable>(ofType type: T.Type) -> T? {
        var decoded: T?
        do {
            decoded = try JSONDecoder().decode(type, from: self)
        } catch let error {
            print("Error decoding data: \(error) MODEL: \(type)")
        }
        return decoded
    }
}
