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
    
    var body: some View {
        HStack {
            
        }
        VStack(spacing: 20) {
            Text(title)
            Text(message)
        }
        .background(Color("AccentColor"))
    }
}

#Preview {
    CardView(
        title: "Titulo",
        message: "Mensaje"
    )
}
