//
//  AppDelegate.swift
//  Millioneros
//
//  Created by VT on 05.11.2022.
//


// Slavomir comitt 1 19:53
// Slavomir commit 2 19:55
// Slavomir commit 3 19:59





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
