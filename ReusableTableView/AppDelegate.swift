//
//  AppDelegate.swift
//  ReusableTableView
//
//  Created by Chirag N Shah on 21/03/19.
//  Copyright © 2019 Chirag N Shah. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow.init(frame: UIScreen.main.bounds)
        
        let firstVC = UINavigationController.init(rootViewController: CallsViewController.init())
        
        firstVC.tabBarItem = UITabBarItem.init(title: "Phone", image: UIImage.init(named: "phone_tab_bar"), tag: 1)
        
        let secondVC = UINavigationController.init(rootViewController: MailViewController.init())
        //secondVC.tabBarItem = UITabBarItem.init(tabBarSystemItem: .featured, tag: 2)
        
        secondVC.tabBarItem = UITabBarItem.init(title: "Mail", image: UIImage.init(named: "mail_tab_bar"), tag: 2)
        
        let thirdVCStoryboard = UIStoryboard.init(name: "Whatsapp", bundle: nil)
        
        let thirdVC = thirdVCStoryboard.instantiateInitialViewController() ?? UIViewController.init()
        
        thirdVC.tabBarItem = UITabBarItem.init(title: "Whatsapp", image: UIImage.init(named: "whatsapp_tab_bar"), tag: 3)

        let fourthVC = UINavigationController.init(rootViewController: MessagesViewController.init())
        fourthVC.tabBarItem = UITabBarItem.init(title: "Messages", image: UIImage.init(named: "messages_tab_bar"), tag: 4)
        
        
        let fifthVC = UINavigationController.init(rootViewController:  AppStoreViewController.init())
        
        fifthVC.tabBarItem = UITabBarItem.init(title: "App Store", image: UIImage.init(named: "appstore_tab_bar"), tag: 5)
        
        
        let tabBarVc = TabBarController.init()
        tabBarVc.viewControllers = [firstVC, secondVC, thirdVC, fourthVC, fifthVC]
        tabBarVc.tabBar.barTintColor = UIColor.white
        tabBarVc.tabBar.isTranslucent = false
        
        //let navVc = UINavigationController.init(rootViewController: thirdVC)
        
        self.window?.rootViewController = tabBarVc
        self.window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

