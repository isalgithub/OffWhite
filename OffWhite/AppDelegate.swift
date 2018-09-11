//
//  AppDelegate.swift
//  OffWhite
//
//  Created by Faishal Alif on 8/5/18.
//  Copyright © 2018 Faishal Alif. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate{

    var window: UIWindow?
    
    
    
    private func splashScreen(){
        let launchScreenVC = UIStoryboard.init(name: "LaunchScreen", bundle: nil)
        let rootVC = launchScreenVC.instantiateViewController(withIdentifier: "splashController")
        self.window?.rootViewController = rootVC
        self.window?.makeKeyAndVisible()
        Timer.scheduledTimer(timeInterval: 3, target: self , selector: #selector(dismissSplashController), userInfo: nil, repeats: false)
        
    }
    
    @objc func dismissSplashController(){
        let mainVC = UIStoryboard.init(name: "Main", bundle: nil)
        let rootVC = mainVC.instantiateViewController(withIdentifier: "initController")
        self.window?.rootViewController = rootVC
        self.window?.makeKeyAndVisible()
        
    }
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {self.splashScreen()
        
        UITabBar.appearance().tintColor = UIColor.black
        UINavigationBar.appearance().tintColor = UIColor.black
        UINavigationBar.appearance().isTranslucent = false
        
        
        
        
        window!.makeKeyAndVisible()
        
        return true
    }


}

