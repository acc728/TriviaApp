//
//  FavoritesCardView.swift
//  Trivia App
//
//  Created by user242582 on 7/12/23.
//

import SwiftUI

struct FavoritesCardView: View {
    var question: Question
    
    var body: some View {
        HStack(spacing: 5) {
            
            Image(question.category.categoryToImageName())
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 80, maxHeight: 80)
                .padding(.leading, 10)
            
            VStack(alignment: .leading) {
                
                Spacer()
                
                Text(question.formattedQuestion)
                    .font(.headline)
                    .fontWeight(.heavy)
                    .foregroundStyle(.white)
                    .lineLimit(3)
                    .multilineTextAlignment(.leading)
                
                Spacer()
                
                HStack {
                    Spacer()
                    Text("favoritesCardView.difficulty".localized() + question.difficulty)
                        .font(.headline)
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 5)
                        .background(question.difficulty == "easy" ?
                            .darkGreen : question.difficulty == "medium"
                                    ? .darkOrange : .darkRed)
                        .clipShape(RoundedRectangle(cornerRadius: 100))

                    Spacer()
                }
                
                
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 5)
            
            Spacer()
            
        }
        .frame(height: 140)
        .background(
            LinearGradient(
                gradient: Gradient(colors: Gradients.redGradient),
                startPoint: .topLeading,
                endPoint: .bottomTrailing))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: .darkGrey,radius: 5, x: 3, y:3)

    }
}

#Preview {
    FavoritesCardView(question: .example)
}
