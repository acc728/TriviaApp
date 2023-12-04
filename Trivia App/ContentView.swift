//
//  ContentView.swift
//  Trivia App
//
//  Created by user242582 on 12/11/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var coordinator: Coordinator
    @State var showOnboarding: Bool = !UserDefaults.standard.bool(forKey: "onboardingShowed")
    
    init() {
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().isTranslucent = true
        UITabBar.appearance().backgroundColor = UIColor(Color("MainColor"))
    }
    
    var body: some View {
        TabView {
            coordinator.makeModeSelectorView()
                .tabItem {
                    Label("contentView.playTab".localized(), systemImage: "gamecontroller.fill")
                }
            
            coordinator.makeFavoritesView()
                .tabItem {
                    Label("contentView.favsTab".localized(), systemImage: "heart.fill")
                }
            
            coordinator.makeStatsView()
                .tabItem {
                    Label("contentView.statsTab", systemImage: "person.text.rectangle.fill")
                }
        }.tint(
            LinearGradient(
                gradient: Gradient(colors: Gradients.redGradient),
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
        )
        .fullScreenCover(
            isPresented: $showOnboarding) {
                OnboardingView(showOnboarding: $showOnboarding)
                    .environmentObject(coordinator.makeOnboardingViewModel())
            }
    }
}


#Preview {
    ContentView()
        .environmentObject(Coordinator(mock: true))
}
