//
//  AppDelegate.swift
//  Calculator
//
//  Created by Aldo Antonio Martinez Avalos on 8/6/19.
//  Copyright © 2019 aavalosmt. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = CalculatorRouter.createModule()
        window?.makeKeyAndVisible()
        
        return true
    }

}

