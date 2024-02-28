//
//  AppDelegate.swift
//  SUITestingProject
//
//  Created by rodrigorovelo on 12/20/23.
//

import AirshipCore
import Foundation
import SwiftUI
import TealiumCore
import TealiumCollect
import TealiumTagManagement

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        // Create Airship config
        let config = AirshipConfig()
        
        // Set default credentials. Alternatively you can set production and development separately
        config.defaultAppKey = "NAED25IJRHSlTU4wJkC3dQ"
        config.defaultAppSecret = "1N3ct1wMTDqnvoEdy4dZ7Q"
        
        
        // Set site. Either .us or .eu
        config.site = .us
        
        // Allowlists for opening URLs. Use * to allow anything
        config.urlAllowListScopeOpenURL = ["*"]
        
        // Call takeOff
        Airship.takeOff(config, launchOptions: launchOptions)
        
        // Ask for notifications permission
        Airship.push.userPushNotificationsEnabled = true
        
        return true
    }
}
