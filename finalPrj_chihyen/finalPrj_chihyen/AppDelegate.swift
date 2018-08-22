//
//  AppDelegate.swift
//  finalPrj_chihyen
//
//  Created by Yen on 2018/6/30.
//  Copyright © 2018年 Yen. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,UNUserNotificationCenterDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        center.requestAuthorization(options: [.alert,.badge,.sound]){ (granted, error) in
            if granted {
                
                DispatchQueue.main.async {
                    center.setNotificationCategories(self.setCategories())
                    application.registerForRemoteNotifications()
                    
//                    let content = UNMutableNotificationContent()
//                    content.categoryIdentifier = "c1"
                }
            }
            
        }
        // Override point for customization after application launch.
        return true
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let token = deviceToken.map {String(format: "%02.2hhx", $0)}.joined()
        print(token)
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print(error)
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
        application.applicationIconBadgeNumber = 0
        
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func setCategories() -> Set<UNNotificationCategory>{
        
        var set = Set<UNNotificationCategory>()
        
        let a1 = UNNotificationAction(
            identifier: "a1", title: "按鈕1", options: [.foreground]
        )
        
        let c1 = UNNotificationCategory(
        
            identifier: "c1", actions: [a1], intentIdentifiers: [], options: []
        )
     
        set.insert(c1)
        return set
        
        
        
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        //print("1111111")
        let action = response.actionIdentifier
        _ = response.notification.request
        if action == "a1"{
            print("asadfsdfasdfsaf")
            let tabbarcontroller = self.window?.rootViewController as! tabBarViewController
            
            tabbarcontroller.selectedIndex = 3
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let homeViewController = storyboard.instantiateViewController(withIdentifier: "NotiVC") as! breakInPhotoViewController
            self.window?.rootViewController?.navigationController?.present(homeViewController, animated: true, completion: nil)
            
            
            
        }
        completionHandler()
    }
    
    

}

