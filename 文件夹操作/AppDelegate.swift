//
//  AppDelegate.swift
//  文件夹操作
//
//  Created by Lizihao Li on 2021/1/2.
//  Copyright © 2021 Lizihao Li. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

       func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
           
           let firstVC: ViewController = ViewController()
           self.window = UIWindow.init(frame: UIScreen.main.bounds)
           self.window?.rootViewController = firstVC
           self.window?.makeKeyAndVisible()
           return true
       }


   

}

