//
//  AppDelegate.swift
//  TDD
//
//  Created by Bob Lee on 10/31/17.
//  Copyright © 2017 Bob Lee. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow.init(frame: UIScreen.main.bounds)
    window?.backgroundColor = .white
    let viewController = ViewController()
    window!.rootViewController = viewController
    window!.makeKeyAndVisible()
    return true
  }
  
}

