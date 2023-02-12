//
//  Hackville2023App.swift
//  Hackville2023
//
//  Created by Roop Malhans on 2023-02-11.
//

import SwiftUI

@main
struct Hackville2023App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ProfileView(coreDM:CoreDataManager())
           // SignUpView(coreDM:CoreDataManager())
        }
    }
}
