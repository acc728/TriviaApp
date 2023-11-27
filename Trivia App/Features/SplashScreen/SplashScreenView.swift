//
//  SplashScreenView.swift
//  Trivia App
//
//  Created by user242582 on 21/11/23.
//

import SwiftUI

struct SplashScreenView: View {
    @EnvironmentObject var coordinator: Coordinator
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
            ContentView()
                .environmentObject(coordinator)
        } else {
            ZStack {
                Color("mainColor")
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    VStack {
                        Image("triviaLogo")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                            .foregroundStyle(
                                LinearGradient(
                                    colors: Gradients.redGradient,
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                        
                        Text("Quiz Trivia App")
                            .foregroundStyle(
                                LinearGradient(
                                    gradient: Gradient(colors: Gradients.redGradient),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing))
                            .font(.largeTitle)
                            .bold()
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 1.2)) {
                            self.opacity = 1.0
                            self.size = 1.0
                        }
                    }
                    Spacer()
                    ProgressView()
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                       withAnimation {
                            self.isActive = true
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
        .environmentObject(Coordinator(mock: true))
}
