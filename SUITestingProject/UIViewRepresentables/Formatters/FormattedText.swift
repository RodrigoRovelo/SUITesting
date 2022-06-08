//
//  FormattedText.swift
//  SUITestingProject
//
//  Created by Rodrigo Rovelo on 4/26/22.
//

import Foundation

public struct FormattedText: Equatable {
  public let formattedText: String
  public let caretBeginOffset: Int
  
  public init(formattedText: String, caretBeginOffset: Int) {
    self.formattedText = formattedText
    self.caretBeginOffset = caretBeginOffset
  }
  
  public static var zero: FormattedText {
    return FormattedText(formattedText: "", caretBeginOffset: 0)
  }
}
