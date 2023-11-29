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

    @AppStorage("currentPage") var currentPage = 1
    var totalPages = 3
    let transition = AnyTransition.asymmetric(insertion: .move(edge: .trailing), removal: .offset(x: -24))

    var body: some View {
        if !viewModel.getOnboardingState() {
            ZStack {
                if(currentPage == 1) {
                    OnboardingTabView(
                        showOnboarding: $showOnboarding,
                        image: "trophy",
                        title: "Step 1",
                        detail: "Texto de prueba con un texto largo para ver si se ve bien el mensaje",
                        backgroundColor: Color("Cantaloupe")
                    )
                    .environmentObject(viewModel)
                    .transition(transition)
                }
                    
                if(currentPage == 2) {
                    OnboardingTabView(
                        showOnboarding: $showOnboarding,
                        image: "trophy",
                        title: "Step 2",
                        detail: "Texto de prueba con un texto largo para ver si se ve bien el mensaje",
                        backgroundColor: Color("DarkRed")
                    )
                    .environmentObject(viewModel)
                    .transition(transition)
                }
                
                if(currentPage == 3) {
                    OnboardingTabView(
                        showOnboarding: $showOnboarding,
                        image: "trophy",
                        title: "Step 3",
                        detail: "Texto de prueba con un texto largo para ver si se ve bien el mensaje",
                        backgroundColor: Color("DarkGreen")
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
                        .foregroundStyle(.black)
                        .frame(width: 60,height: 60)
                        .background(.white)
                        .clipShape(Circle())
                        .overlay(
                            ZStack {
                                Circle()
                                    .stroke(Color.black.opacity(0.1), lineWidth: 4)
                                
                                Circle()
                                    .trim(from: 0, to: CGFloat(currentPage)/CGFloat(totalPages))
                                    .stroke(Color.white, lineWidth: 4)
                                    .rotationEffect(.init(degrees: -90))
                            }.padding(-15))
                })
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

