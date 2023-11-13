//
//  MainButton.swift
//  Trivia App
//
//  Created by user242582 on 13/11/23.
//

import SwiftUI

struct MainButton: View {
    var text: String
    var background: Color = Color("AccentColor")
    
    var body: some View {
        Text(text)
            .foregroundStyle(.white)
            .padding()
            .padding(.horizontal)
            .background(background)
            .cornerRadius(30)
            .shadow(radius: 10)
    }
}


#Preview {
    MainButton(text: "Play")
}
