//
//  SUITestingProjectApp.swift
//  SUITestingProject
//
//  Created by APPLAUDO on 4/20/22.
//

import SwiftUI

@main
struct SUITestingProjectApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                ContentView()
            }
        }
    }
}
