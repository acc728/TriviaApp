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
            coordinator.makeQuestionView()
                .tabItem {
                    Label("contentView.playTab".localized(), systemImage: "checkmark.circle.badge.questionmark.fill")
                }
            
            Text("Favorites")
                .tabItem {
                    Label("contentView.favoritesTab", systemImage: "heart.fill")
                }
        }
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
