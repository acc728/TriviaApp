//
//  StringExtensions.swift
//  Trivia App
//
//  Created by user242582 on 13/11/23.
//

import Foundation

extension String {
    func localized() -> String {
        NSLocalizedString(self, bundle: .main, comment: "")
    }
}
