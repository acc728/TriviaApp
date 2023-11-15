//
//  ContentView.swift
//  Trivia App
//
//  Created by user242582 on 12/11/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
        TabView {
            coordinator.makeModeSelectorView()
                .tabItem {
                    Label("contentView.playTab".localized(), systemImage: "gamecontroller.fill")
                }
            
            Text("Favorites")
                .tabItem {
                    Label("contentView.statsTab", systemImage: "person.text.rectangle.fill")
                }
        }.tint(
            LinearGradient(
                gradient: Gradient(colors: Gradients.redGradient),
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
        )
        
        /*.fullScreenCover(isPresented: $showOnboarding) {
         OnboardingTabView()
         }*/ 
        
        // LANDING PAGE
    }
}


#Preview {
    ContentView()
        .environmentObject(Coordinator(mock: true))
}
