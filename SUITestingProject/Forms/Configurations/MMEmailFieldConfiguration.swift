//
//  MMEmailFieldConfiguration.swift
//  SUITestingProject
//
//  Created by APPLAUDO on 4/21/22.
//

import CombineForms
import UIKit

struct MMEmailFieldConfiguration: CombineFormFieldConfiguration {
    let required: CombineFormFieldRule = MMRequiredEmailRule()
    let email: CombineFormFieldRule = MMEmailRule()
    public var rules: [CombineFormFieldRule] {
        [self.required, email]
    }
    
    public var keyboardType: UIKeyboardType {
        .emailAddress
    }
}
