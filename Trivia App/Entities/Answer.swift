//
//  Answer.swift
//  Trivia App
//
//  Created by user242582 on 13/11/23.
//

import Foundation

struct Answer: Identifiable {
    var id = UUID()
    var text: AttributedString
    var isCorrect: Bool
    
    static var example: Answer {
        .init(
            text: "Black Hole",
            isCorrect: true
        )
    }
}
