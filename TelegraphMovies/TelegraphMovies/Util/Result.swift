//
//  Result.swift
//  TelegraphMovies
//
//  Created by Jeevan Thandi on 12/06/2018.
//  Copyright © 2018 Airla Tech Ltd. All rights reserved.
//

import Foundation

enum Result<Value> {
    case success(Value)
    case failure(Error)

    public func errorValue() -> Error? {
        switch self {
        case .failure(let error):
            return error
        default:
            return nil
        }
    }

    public func successValue() -> Value? {
        switch self {
        case .success(let result):
            return result
        default:
            return nil
        }
    }
}

typealias CallbackResult<T> = (Result<T>) -> Void
