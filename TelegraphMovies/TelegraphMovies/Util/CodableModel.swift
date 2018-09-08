//
//  CodableModel.swift
//  TelegraphMovies
//
//  Created by Jeevan Thandi on 08/09/2018.
//  Copyright © 2018 Airla Tech Ltd. All rights reserved.
//

import Foundation

public protocol CodableModel: Codable {
    func encode() -> Data?

    func equals(_ item: CodableModel) -> Bool
}

extension CodableModel {

    public func encode() -> Data? {
        do {
            return try JSONEncoder().encode(self)
        } catch let error {
            print("----Error Encoding model: \(self) | Reason: \(error.localizedDescription)")
            return nil
        }
    }

    public func equals(_ item: CodableModel) -> Bool {
        return self.encode() == item.encode()
    }
}

