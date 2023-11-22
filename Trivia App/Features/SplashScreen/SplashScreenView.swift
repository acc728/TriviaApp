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
        } else {
            ZStack {
                Color.white
                    .ignoresSafeArea()
                
                VStack {
                    VStack {
                        Image(systemName: "questionmark")
                            .resizable()
                            .frame(width: 50, height: 80)
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
                            self.size = 1
                        }
                    }
                }.onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
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
