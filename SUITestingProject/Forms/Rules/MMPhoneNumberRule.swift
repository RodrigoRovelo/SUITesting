//
//  MMPhoneNumberRule.swift
//  SUITestingProject
//
//  Created by APPLAUDO on 4/21/22.
//

import Foundation
import CombineForms

struct MMPhoneNumerRule: CombineFormFieldRule {
    
    var notValidMessage: String {
        "Numero no valido."
    }
    var priority: Int {
        5
    }
    
    func validate(text: String) -> Bool {
        text.count > 8
    }
}

