//
//  CardView.swift
//  Trivia App
//
//  Created by user242582 on 14/11/23.
//

import SwiftUI

struct CardView: View {
    var title: String
    var message: String
    var systemName: String
    var imageName: String
    var colorsGradient: [Color]
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Spacer()
                Image(systemName: systemName)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundStyle(.white)
                
                Text(title)
                    .bold()
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                Text(message)
                    .font(.title3)
                    .foregroundStyle(.white)
                
            }
            .padding()
            
            Spacer()
            
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 200)
                .padding(.trailing, 10)
            
        }
        .frame(maxWidth: .infinity, maxHeight: 240)
        .background(
            LinearGradient(
                gradient: Gradient(colors: colorsGradient),
                startPoint: .topLeading,
                endPoint: .bottomTrailing))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: .gray, radius: 5, x: 3, y: 3)
    }
    
}

#Preview {
    CardView(
        title: "Quiz Mode",
        message: " List of questions!",
        systemName: "trophy.fill",
        imageName: "question",
        colorsGradient: Gradients.blueGradient
    )
}
