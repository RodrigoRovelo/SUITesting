//
//  TextFormatter.swift
//  SUITestingProject
//
//  Created by Rodrigo Rovelo on 4/26/22.
//

import Foundation

struct TextFormatter {
    var textPattern: String
    let patternSymbol: Character
    
    func format(_ unformattedText: String?) -> String? {
      guard let unformattedText = unformattedText else { return nil }
      var formatted = ""
      var unformattedIndex = 0
      var patternIndex = 0
      
      while patternIndex < textPattern.count && unformattedIndex < unformattedText.count {
        guard let patternCharacter = textPattern.characterAt(patternIndex) else { break }
        if patternCharacter == patternSymbol {
          if let unformattedCharacter = unformattedText.characterAt(unformattedIndex) {
            formatted.append(unformattedCharacter)
          }
          unformattedIndex += 1
        } else {
          formatted.append(patternCharacter)
        }
        patternIndex += 1
      }
      return formatted
    }

    func unformat(_ formatted: String?) -> String? {
      guard let formatted = formatted else { return nil }
      var unformatted = String()
      var formattedIndex = 0
      
      while formattedIndex < formatted.count {
        if let formattedCharacter = formatted.characterAt(formattedIndex) {
          if formattedIndex >= textPattern.count {
            unformatted.append(formattedCharacter)
          } else if formattedCharacter != textPattern.characterAt(formattedIndex) || formattedCharacter == patternSymbol {
            unformatted.append(formattedCharacter)
          }
          formattedIndex += 1
        }
      }
      return unformatted
    }
    
    mutating func modifyTextPattern(with textPattern: String) {
        self.textPattern = textPattern
    }
}
