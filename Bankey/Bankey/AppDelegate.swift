//
//  AppDelegate.swift
//  Bankey
//
//  Created by Raghuram on 06/03/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
     //   window?.rootViewController = LoginViewController()
      //  window?.rootViewController = OnBoardingViewController(heroImageName: "delorean", titleText: "Vector based assets scales much better than retina image adobe illustrator is a vector based graphics drawing tool ")
        window?.rootViewController = OnboardingContainerViewController()
        return true
    }

   


}

