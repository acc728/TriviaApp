//
//  FavoritesDetailCardView.swift
//  Trivia App
//
//  Created by user242582 on 7/12/23.
//

import SwiftUI

struct FavoritesDetailCardView: View {
    var question: Question
    
    var body: some View {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Text("favoritesDetailCardView.question".localized())
                            .font(.headline)
                            .fontWeight(.heavy)
                            .foregroundStyle(.white)
                            .multilineTextAlignment(.leading)
                        
                        Text(question.formattedQuestion)
                            .fontWeight(.regular)
                            .foregroundStyle(.white)
                            .multilineTextAlignment(.leading)
                    }
                    
                    HStack {
                        Text("favoritesDetailCardView.category".localized())
                            .font(.headline)
                            .fontWeight(.heavy)
                            .foregroundStyle(.white)
                            .multilineTextAlignment(.leading)
                        
                        Text(question.category)
                            .fontWeight(.regular)
                            .foregroundStyle(.white)
                            .multilineTextAlignment(.leading)
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("favoritesDetailCardView.answers".localized())
                            .font(.headline)
                            .fontWeight(.heavy)
                            .foregroundStyle(.white)
                            .multilineTextAlignment(.leading)
                        
                        ForEach(question.answers) { answer in
                            HStack {
                                Image(systemName: "circle.fill")
                                Text(answer.text)
                                    .fontWeight(.regular)
                                    .multilineTextAlignment(.leading)
                                Spacer()
                            }
                            .padding(.leading, 20)
                            .foregroundColor(.white)
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("favoritesDetailCardView.correctAnswer".localized())
                            .font(.headline)
                            .fontWeight(.heavy)
                            .foregroundStyle(.white)
                            .multilineTextAlignment(.leading)
                        
                        
                        HStack {
                            Image(systemName: "checkmark.circle.fill")
                            Text(question.correctAnswer)
                                .font(.title3)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.leading)
                            Spacer()
                        }
                        .foregroundStyle(.darkGreen)
                        .padding(.leading, 20)
                        .foregroundColor(.white)
                    }
                }
                
                .padding(10)
                
                
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: 300)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: Gradients.redGradient),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(color: .darkGrey, radius: 5, x: 3, y:3)
        }
    
}

#Preview {
    FavoritesDetailCardView(question: .example)
}
