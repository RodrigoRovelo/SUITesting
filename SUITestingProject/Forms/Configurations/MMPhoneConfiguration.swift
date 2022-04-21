//
//  MMPhoneConfiguration.swift
//  SUITestingProject
//
//  Created by APPLAUDO on 4/21/22.
//

import UIKit
import CombineForms

struct MMPhoneNumberFieldConfiguration: CombineFormFieldConfiguration {
    let phoneNumberCorrect: CombineFormFieldRule = MMPhoneNumerRule()
    public var rules: [CombineFormFieldRule] {
        [phoneNumberCorrect]
    }
    
    public var keyboardType: UIKeyboardType {
        .phonePad
    }
    
    public func transform(text: String) -> String {
            text.toPhoneNumber()
    }
}


