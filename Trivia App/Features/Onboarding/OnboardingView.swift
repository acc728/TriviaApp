//
//  OnboardingView.swift
//  Trivia App
//
//  Created by user242582 on 27/11/23.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                HStack {
                    Text("Welcome user!")
                        .font(.title)
                        .fontWeight(.semibold)
                        .kerning(1.4)
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        Text("Skip")
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                    })
                }.padding()
                
                Spacer(minLength: 0)
                
                Image("trophy")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Text("Step 1")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                    .padding(.top)
                
                Text("Texto de prueba con un texto largo para ver si se ve bien el mensaje")
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .kerning(1.3)
                
                Spacer(minLength: 0)
            }.background(Color("Cantaloupe").ignoresSafeArea())
        }.overlay(
        Button(action: {
            
        }, label: {
            Image(systemName: "chevron.right")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(.black)
                .frame(width: 60,height: 60)
                .background(.white)
                .clipShape(Circle())
        }),alignment: .bottom)
    }
}

#Preview {
    OnboardingView()
}
