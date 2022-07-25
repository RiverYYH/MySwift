//
//  AppDelegate.swift
//  SwiftDay _1
//
//  Created by Yanghe on 2022/7/14.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow.init(frame: UIScreen.main.bounds);
        let rootCtr = RootViewController.init();
        self.window?.rootViewController = rootCtr;
        self.window?.makeKeyAndVisible();
        
        return true
    }


}

