//
//  OnboardingView.swift
//  Trivia App
//
//  Created by user242582 on 27/11/23.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("currentPage") var currentPage = 1
    var totalPages = 3
    
    var body: some View {
        ZStack {
            if(currentPage == 1) {
                ScreenView(
                    image: "trophy",
                    title: "Step 1",
                    detail: "Texto de prueba con un texto largo para ver si se ve bien el mensaje",
                    backgroundColor: Color("Cantaloupe")
                ).transition(.scale)
            }
                
            if(currentPage == 2) {
                ScreenView(
                    image: "trophy",
                    title: "Step 2",
                    detail: "Texto de prueba con un texto largo para ver si se ve bien el mensaje",
                    backgroundColor: Color("DarkRed")
                ).transition(.scale)
            }
            
            if(currentPage == 3) {
                ScreenView(
                    image: "trophy",
                    title: "Step 3",
                    detail: "Texto de prueba con un texto largo para ver si se ve bien el mensaje",
                    backgroundColor: Color("DarkGreen")
                ).transition(.scale)
            }

        }.overlay(
            Button(action: {
                withAnimation(.easeInOut) {
                    if currentPage <= totalPages {
                        currentPage += 1
                    } else {
                        currentPage = 1
                        //Cambiar variable binding que muestra esta pantalla
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

#Preview {
    OnboardingView()
}

struct ScreenView: View {
    var image: String
    var title: String
    var detail: String
    var backgroundColor: Color
    
    @AppStorage("currentPage") var currentPage = 1
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                
                if currentPage == 1 {
                    Text("Welcome user!")
                        .font(.title)
                        .fontWeight(.semibold)
                        .kerning(1.4)
                    
                }else {
                    Button {
                        withAnimation(.easeInOut) {
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
                    withAnimation(.easeInOut) {
                        currentPage = 4
                    }
                }, label: {
                    Text("Skip")
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                })
            }.padding()
            
            Spacer(minLength: 0)
            
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.black)
                .padding(.top)
            
            Text(detail)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .kerning(1.3)
            
            Spacer(minLength: 120)
        }.background(backgroundColor
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .ignoresSafeArea()
        )
    }
}

