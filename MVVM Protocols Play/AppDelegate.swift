//
//  AppDelegate.swift
//  MVVM Protocols Play
//
//  Created by Andy Bell on 08/02/2017.
//  Copyright © 2017 snapp. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var masterCoordinator:MasterCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
       
        window = UIWindow()
        masterCoordinator = MasterCoordinator(window: window!)
        masterCoordinator.start()
        window?.makeKeyAndVisible()
        
        return true
    }

}

