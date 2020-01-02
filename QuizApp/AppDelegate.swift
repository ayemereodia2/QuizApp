//
//  AppDelegate.swift
//  QuizApp
//
//  Created by Ayemere  Odia  on 30/12/2019.
//  Copyright © 2019 Ayemere  Odia . All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = QuestionViewController(question: "Question 1?", options: ["Option 1", "Option 2"]){
            print($0)
        }
        _ = viewController.view
        viewController.tableView.allowsMultipleSelection = true
        window.rootViewController = viewController
        self.window = window
        
        window.makeKeyAndVisible()
        return true
    }

    


}

