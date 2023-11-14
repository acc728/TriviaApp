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
        }
        .frame(maxWidth: .infinity, maxHeight: 240)
        .background(
            LinearGradient(
                gradient: Gradient(colors: colorsGradient),
                startPoint: .topLeading,
                endPoint: .bottomTrailing))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 5, x: 3, y: 3)
    }
}

#Preview {
    CardView(
        title: "Quiz Mode",
        message: " List of questions!",
        systemName: "trophy.fill",
        colorsGradient: [Color(hex: 0xFF4470),
                 Color(hex: 0xF4698A),
                 Color(hex: 0xF89051),
                 Color(hex: 0xFAB168)]
        
        /* Gradient Red
         [Color(hex: 0xFF4470),
          Color(hex: 0xF4698A),
          Color(hex: 0xF89051),
          Color(hex: 0xFAB168)]
         */
        
        /* Gradient Blue
         [Color(hex: 0x2C3EE2),
          Color(hex: 0x4B69DE),
          Color(hex: 0x1791D6),
          Color(hex: 0x17AAD6)]*/
    )
}
