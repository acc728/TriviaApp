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
    
    func categoryToImageName() -> String {
        if(self.lowercased().contains("science")) {
            return "Science"
        }
            
        else if(self.lowercased().contains("music")) {
            return "Music"
        }
        
        else if(self.lowercased().contains("sport")) {
            return "Sport_and_leisure"
        }
        
        else if(self.lowercased().contains("society")) {
            return "Society_and_culture"
        }
        
        else if(self.lowercased().contains("film")) {
            return "Films_and_tv"
        }
        
        else if(self.lowercased().contains("arts")) {
            return "Arts_and_literature"
        }
        
        else if(self.lowercased().contains("history")) {
            return "History"
        }
        
        else if(self.lowercased().contains("geography")) {
            return "Geography"
        }
        
        else if(self.lowercased().contains("food")) {
            return "Food_and_drink"
        }
        
        else {
            return "General_knowledge"
        }
    }
}


