//
//  CustomDialog.swift
//  Trivia App
//
//  Created by user242582 on 10/12/23.
//

import SwiftUI

struct CustomDialog: View {
    @Binding var isActive: Bool
    
    let title: String
    let message: String
    let action: () -> ()
    
    var body: some View {
        ZStack {
            Color(.black)
                .opacity(0.15)
                .ignoresSafeArea()
                .onTapGesture {
                    close()
                }
            
            VStack {
                Text(title)
                    .font(.title2)
                    .bold()
                    .padding()
                
                Text(message)
                    .font(.body)
                
                HStack {
                    Button {
                        close()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundStyle(LinearGradient(
                                    colors: Gradients.blueGradient,
                                    startPoint: .leading,
                                    endPoint: .trailing
                                ))
                            
                            Text("Cancel")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                        }
                        .padding()
                    }
                    
                    Button {
                        action()
                        close()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundStyle(LinearGradient(
                                    colors: Gradients.redGradient,
                                    startPoint: .leading,
                                    endPoint: .trailing
                                ))
                            
                            Text("Confirm")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                        }
                        .padding()
                    }
                }
            }
            .fixedSize(horizontal: false, vertical: true)
            .padding()
            .background(Color("MainColor"))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: .darkGrey, radius: 5, x: 3, y: 3)
            .padding(30)
        }
        .ignoresSafeArea()
    }
    
    func close() {
        withAnimation(.spring()) {
            isActive = false
        }
    }
}

#Preview {
    CustomDialog(isActive: .constant(true), title: "Exit game?", message: "All the progress will be lost. Do you want to leave the game?", action: {})
}

