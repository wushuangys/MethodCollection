//
//  AppDelegate.swift
//  MethodCollection
//
//  Created by 无双 on 2022/3/26.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        
        let nav = UINavigationController(rootViewController: ViewController())
        window?.rootViewController = nav
        
        return true
    }


}

