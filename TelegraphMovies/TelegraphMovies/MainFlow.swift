//
//  MainFlow.swift
//  TelegraphMovies
//
//  Created by Jeevan Thandi on 30/06/2018.
//  Copyright © 2018 Airla Tech Ltd. All rights reserved.
//

import Foundation
import UIKit

protocol MainFlowProtocol {
    func start()
}

final class MainFlow: MainFlowProtocol {

    private let window: UIWindow
    private let screenFactory: ScreenFactory

    init(window: UIWindow,
         screenFactory: ScreenFactory = TelegraphScreenFactory()) {
        self.screenFactory = screenFactory
        self.window = window
    }

    func start() {
        window.rootViewController = screenFactory.createArticleList()
    }

}
