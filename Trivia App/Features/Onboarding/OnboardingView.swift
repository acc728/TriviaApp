//
//  OnboardingView.swift
//  Trivia App
//
//  Created by user242582 on 27/11/23.
//

import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject private var viewModel: OnboardingViewModel
    @Binding var showOnboarding: Bool
    @Environment(\.colorScheme) var colorScheme
    
    @AppStorage("currentPage") var currentPage = 1
    var totalPages = 3
    let transition = AnyTransition.asymmetric(insertion: .move(edge: .trailing), removal: .offset(x: -24))
    
    var body: some View {
        if !viewModel.getOnboardingState() {
            ZStack {
                if(currentPage == 1) {
                    OnboardingTabView(
                        showOnboarding: $showOnboarding,
                        image: "onboardingQuiz",
                        title: "onboardingTabView.title1".localized(),
                        detail: "onboardingTabView.message1".localized()
                    )
                    .environmentObject(viewModel)
                    .transition(transition)
                }
                
                if(currentPage == 2) {
                    OnboardingTabView(
                        showOnboarding: $showOnboarding,
                        image: "onboardingGame",
                        title: "onboardingTabView.title2".localized(),
                        detail: "onboardingTabView.message2".localized()
                    )
                    .environmentObject(viewModel)
                    .transition(transition)
                }
                
                if(currentPage == 3) {
                    OnboardingTabView(
                        showOnboarding: $showOnboarding,
                        image: "onboardingStats",
                        title: "onboardingTabView.title3".localized(),
                        detail: "onboardingTabView.message3".localized()
                    )
                    .environmentObject(viewModel)
                    .transition(transition)
                }
                
            }
            .animation(.easeInOut, value: currentPage)
            .overlay(
                Button(action: {
                    withAnimation {
                        if currentPage < totalPages {
                            currentPage += 1
                        } else {
                            currentPage = 1
                            showOnboarding = false
                            viewModel.saveOnboardingState(showed: true)
                        }
                    }
                }, label: {
                    Image(systemName: "chevron.right")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(colorScheme == .light ? .white : .black)
                        .frame(width: 50,height: 60)
                        .background(colorScheme == .light ? .black : .white)
                        .clipShape(Circle())
                        .overlay(
                            ZStack {
                                CircularProgressView(
                                    progress:  CGFloat(currentPage)/CGFloat(totalPages),
                                    color: Color.pink,
                                    gradient: Gradients.redGradient,
                                    lineWidth: 10)
                            }.padding(-15))
                    }
                )
                .padding(.bottom, 20)
                ,alignment: .bottom)
        }
    }
}

#Preview {
    let coordinator = Coordinator()
    return OnboardingView(showOnboarding: Binding.constant(false))
        .environmentObject(coordinator.makeOnboardingViewModel())
}

