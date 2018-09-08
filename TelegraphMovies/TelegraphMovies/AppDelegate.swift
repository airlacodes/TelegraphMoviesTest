//
//  AppDelegate.swift
//  TelegraphMovies
//
//  Created by Jeevan Thandi on 12/06/2018.
//  Copyright © 2018 Airla Tech Ltd. All rights reserved.
//

import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        guard notRunningTests() else {
            return false
        }

        guard let window = self.window else {
            fatalError("Nil UIWindow")
        }

        let mainFlow = MainFlow(window: window)
        mainFlow.start()

        return true
    }
}

extension AppDelegate {
    fileprivate func notRunningTests() -> Bool {
        return NSClassFromString("XCTestCase") == nil
    }
}
