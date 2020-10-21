//
//  ViewController.swift
//  addingFlutterToExistingIosProject
//
//  Created by Digital Dividend on 10/17/20.
//  Copyright © 2020 Digital Dividend. All rights reserved.
//

import UIKit
import Flutter

struct sendDataBack:Codable {
    let value:String
    let color:String
}
class ViewController: UIViewController {
  let button = UIButton(type:UIButton.ButtonType.custom)
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
         // Make a button to call the showFlutter function when pressed.
//        let button = UIButton(type:UIButton.ButtonType.custom)
        button.addTarget(self, action: #selector(showFlutter), for: .touchUpInside)
        button.setTitle("Show Flutter!", for: UIControl.State.normal)
        button.frame = CGRect(x: self.view.frame.size.width/2 - 160.0, y: self.view.frame.size.height/2 -  40, width: 160.0, height: 40.0)
        button.backgroundColor = UIColor.blue
        self.view.addSubview(button)
        // Do any additional setup after loading the view.
    }

    //display the flutter screen
    @objc func showFlutter() {
        let flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
           let flutterViewController =
               FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
           present(flutterViewController, animated: true, completion: nil)
        
        //Creating a channel for communicating with the Flutter module
        let DataChannelFromIosToFlutter = FlutterMethodChannel(name: "com.addingFlutterToExistingIosProject/data", binaryMessenger: flutterViewController.binaryMessenger)
        
 
        var json: String? = nil
        
        let jsonObject = sendDataBack(value: "sending data back to flutter ", color: "blue")
        let encoder = JSONEncoder()
        if let insectData = try? encoder.encode(jsonObject),
            let jsonString = String(data: insectData, encoding: .utf8)
            {
            json = jsonString
            print(jsonString)
        }

        //invoking a method in flutter and sending data to flutter from ios native
        DataChannelFromIosToFlutter.invokeMethod("fromHostToClient", arguments: json )
        
        
        //one instance of the FlutterEngine can only be attached to one FlutterViewController at a time. Set FlutterEngine.viewController to nil before attaching it to another FlutterViewController.
        //Creating a channel for communicating with the Flutter module
        let DataChannelFromFlutterToIOS = FlutterMethodChannel(name: "com.addingFlutterToExistingIosProject/callBack", binaryMessenger: flutterViewController.binaryMessenger)
        
        //for recieving data from flutter
        //also has callback option to dismiss
        DataChannelFromFlutterToIOS.setMethodCallHandler { (call: FlutterMethodCall, result: FlutterResult) in
            if call.method == "toIos" {
             print("arguments")
                flutterViewController.dismiss(animated: true, completion: nil)

            }
        }
 
     }
}

