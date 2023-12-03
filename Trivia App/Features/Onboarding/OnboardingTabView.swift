//
//  OnboardingTabView.swift
//  Trivia App
//
//  Created by user242582 on 29/11/23.
//

import SwiftUI

struct OnboardingTabView: View {
    @EnvironmentObject private var viewModel: OnboardingViewModel
    @Binding var showOnboarding: Bool
    var image: String
    var title: String
    var detail: String
    var backgroundColor: Color = Color("MainColor")
    
    @AppStorage("currentPage") var currentPage = 1
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                
                if currentPage == 1 {
                    Text("onboardingTabView.welcome".localized())
                        .font(.title)
                        .fontWeight(.bold)
                        .kerning(1.4)
                        .foregroundStyle(
                            LinearGradient(
                                gradient: Gradient(colors: Gradients.redGradient),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing))
                    
                }else {
                    Button {
                        withAnimation {
                            currentPage -= 1
                        }
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .background(.black.opacity(0.4))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    
                }
                Spacer()
                
                Button(action: {
                    withAnimation {
                        showOnboarding = false
                        viewModel.saveOnboardingState(showed: true)
                        currentPage = 1
                    }
                }, label: {
                    Text("onboardingTabView.skip".localized())
                        .fontWeight(.semibold)
                        .foregroundStyle(
                            LinearGradient(
                                gradient: Gradient(colors: Gradients.redGradient),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing))
                })
            }.padding()
            
            Spacer(minLength: 0)
            
            Image(image)
                .resizable()
                .scaledToFit()
            
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.top)
            
            Text(detail)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .kerning(1.2)
                .padding(.horizontal, 10)
            
            Spacer(minLength: 150)
        }.background(backgroundColor
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .ignoresSafeArea()
        )
    }
}

#Preview {
    OnboardingTabView(
        showOnboarding: Binding.constant(false),
        image: "onboarding_learn",
        title: "Step 1",
        detail: "Texto de prueba con un texto largo para ver si se ve bien el mensaje"
    )
}
