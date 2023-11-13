//
//  ContentView.swift
//  Trivia App
//
//  Created by user242582 on 12/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Text("Questions")
                .tabItem {
                    Label("contentView.questionsTab".localized(), systemImage: "checkmark.circle.badge.questionmark.fill")
                }
            
            Text("Favorites")
                .tabItem {
                    Label("contentView.favoritesTab", systemImage: "heart.fill")
                }
        }
        /*.fullScreenCover(isPresented: $showOnboarding) {
         OnboardingTabView()
         }*/ // LANDING PAGE
    }
}


#Preview {
    ContentView()
}
