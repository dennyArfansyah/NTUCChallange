//
//  AppDelegate.swift
//  NTUCChallange
//
//  Created by Denny Arfansyah on 02/07/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = HomeController()
        window.makeKeyAndVisible()
        
        return true
    }

}
