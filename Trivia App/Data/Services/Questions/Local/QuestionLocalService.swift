//
//  QuestionLocalService.swift
//  Trivia App
//
//  Created by user242582 on 16/11/23.
//

import Foundation

protocol QuestionLocalService {
    func getStreak() throws -> Int
    func save(streak: Int) throws
}
