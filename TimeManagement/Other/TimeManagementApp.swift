//
//  TimeManagementApp.swift
//  TimeManagement
//
//  Created by Nikita Dubinker on 1/26/24.
//
import FirebaseCore
import SwiftUI

@main
struct TimeManagementApp: App {
    init (){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
        }
    }
}
