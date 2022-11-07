//
//  AppDelegate.swift
//  Millioneros
//
//  Created by VT on 05.11.2022.

// Slavomir commit 1 21:39

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow()
        window.makeKeyAndVisible()
        let controller = WelcomeVC()
        let navController = UINavigationController(rootViewController: controller)
        window.rootViewController = navController
        self.window = window
        return true
    }
    
}
