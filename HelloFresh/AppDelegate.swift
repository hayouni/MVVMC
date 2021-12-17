//
//  AppDelegate.swift
//  HelloFresh
//
//  Created by Saiefeddine HAYOUNI on 03/12/2021.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    // Make the first coordinator with a strong reference
    var appCoordinator : Coordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController()

        // Initialise the coordinator with the main navigation controller
        appCoordinator = Coordinator(navigationController: window?.rootViewController as! UINavigationController)

        // The start method will actually display the main view
        appCoordinator?.start()
        window?.makeKeyAndVisible()
        return true
    }
}

