//
//  EmailMultiMoneyRule.swift
//  SUITestingProject
//
//  Created by APPLAUDO on 4/21/22.
//

import Foundation
import CombineForms
import UIKit

struct MMEmailRule: CombineFormFieldRule {
    
    var notValidMessage: String {
        "Por favor ingresar un email valido."
    }
    var priority: Int {
        5
    }
    
    func validate(text: String) -> Bool {
        text.isValidEmail()
    }
}

struct MMRequiredEmailRule: CombineFormFieldRule {
    
    var notValidMessage: String {
        "Correo electronico requerido."
    }
    var priority: Int {
        9
    }
    
    func validate(text: String) -> Bool {
        !text.isEmpty
    }
}

extension String {
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegEx).evaluate(with: self)
    }
}
