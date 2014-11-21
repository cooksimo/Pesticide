//
//  AppDelegate.swift
//  debugdrawer
//
//  Created by Elias Bagley on 11/21/14.
//  Copyright (c) 2014 Rocketmade. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var isDebugging: Bool?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        let threeFingerTap = UITapGestureRecognizer(target: self, action: Selector("threeFingerTap"))
        threeFingerTap.numberOfTouchesRequired = 3
        self.window?.addGestureRecognizer(threeFingerTap)
        
        var rootView = SampleViewController()
        
        if let window = self.window {
            window.rootViewController = rootView
        }
        
        return true
    }
    
    func threeFingerTap() {
        var topVC :UIViewController = self.topViewController(self.window!.rootViewController!)
        if (topVC.isKindOfClass(DebugTableController)) {
            topVC.dismissViewControllerAnimated(true, completion: nil)
        } else {
            let debugVC = Pesticide.debugViewController()
            topVC.presentViewController(debugVC, animated: true, completion: nil)
        }
    }
    
    func topViewController(rootController :UIViewController)->UIViewController {
        if (rootController.presentedViewController != nil) {
            return topViewController(rootController.presentedViewController!)
        } else {
            return rootController;
        }
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

