//
//  AppDelegate.swift
//  basic-swift-programmatically-NotificationCenter
//
//  Created by Burak Ertaş on 26.09.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        let vc = UINavigationController(rootViewController: ViewController())
        window?.rootViewController = vc
        
        return true
    }

    


}

