//
//  Trivia_AppApp.swift
//  Trivia App
//
//  Created by user242582 on 12/11/23.
//

import SwiftUI

@main
struct Trivia_AppApp: App {
    let coordinator = Coordinator()
    @State private var isActive = false
    
    var body: some Scene {
        WindowGroup {
            if isActive {
                ContentView()
                    .environmentObject(coordinator)
            } else {
                SplashScreenView(isActive: $isActive)
                    .environmentObject(coordinator)
            }
        }
    }
}
