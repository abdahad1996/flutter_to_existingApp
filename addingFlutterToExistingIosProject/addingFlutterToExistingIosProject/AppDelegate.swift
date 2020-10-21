//
//  AppDelegate.swift
//  addingFlutterToExistingIosProject
//
//  Created by Digital Dividend on 10/17/20.
//  Copyright © 2020 Digital Dividend. All rights reserved.
//

import UIKit
import FlutterPluginRegistrant

@UIApplicationMain
class AppDelegate: FlutterAppDelegate{

    lazy var flutterEngine = FlutterEngine(name: "my flutter engine")
    //FlutterViewController is used to display a Flutter screen inside the native iOS app. But for using this, we will also need to create a FlutterEngine.

//    The proper place to create a FlutterEngine is inside the AppDelegate.swift file
    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
         //Runs the default Dart entrypoint with a default Flutter route.
        self.flutterEngine.run(withEntrypoint: nil)
        // Used to connect plugins (only if you have plugins with iOS platform code).
        GeneratedPluginRegistrant.register(with: self.flutterEngine)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions);
    }

  

}

