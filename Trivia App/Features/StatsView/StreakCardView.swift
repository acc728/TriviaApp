//
//  StreakCardView.swift
//  Trivia App
//
//  Created by user242582 on 16/11/23.
//

import SwiftUI

struct StreakCardView: View {
    var imageName: String
    var colorsGradient: [Color]
    var streak: Int
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                
                Spacer()
                
                Text("Survival Mode!")
                    .bold()
                    .font(.title2)
                    .foregroundStyle(.white)
                
                Spacer()
                
                HStack {
                    Text("Best streak: ")
                        .font(.title3)
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                    
                    Text("‌‌\(streak)")
                        .font(.title)
                        .foregroundStyle(.pink)
                        .bold()
                }

                Spacer()
                
            }
            .padding()
            
            Spacer()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 100)
                .padding(.trailing, 10)
            
        }
        .frame(maxWidth: .infinity, maxHeight: 120)
        .background(
            LinearGradient(
                gradient: Gradient(colors: colorsGradient),
                startPoint: .topLeading,
                endPoint: .bottomTrailing))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: .darkGrey, radius: 5, x: 3, y: 3)
    }
    
}

#Preview {
    StreakCardView(
        imageName: "trophy",
        colorsGradient: Gradients.blueGradient,
        streak: 54
    )
}
