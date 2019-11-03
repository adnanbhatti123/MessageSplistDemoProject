//
//  AppDelegate.swift
//  Demo_Project
//
//  Created by MAC on 02/11/2019.
//  Copyright © 2019 MAC. All rights reserved.
//

import UIKit
import Firebase
import TwitterKit
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
   //   FirebaseApp.configure();
      //TWTRTwitter.sharedInstance().start(withConsumerKey:"", consumerSecret:"")
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
   
  
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
    let twitterAuthentication = TWTRTwitter.sharedInstance().application(app, open: url, options: options)
     return  twitterAuthentication
   }
      // Your other open URL handlers follow […]
    }
