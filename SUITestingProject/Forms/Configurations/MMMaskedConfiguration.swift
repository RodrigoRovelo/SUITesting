//
//  MMMaskedConfiguration.swift
//  SUITestingProject
//
//  Created by APPLAUDO on 4/22/22.
//

import UIKit
import CombineForms

struct MMMaskedConfiguration: CombineFormFieldConfiguration {
    let required: CombineFormFieldRule = MaskedRequiredRule()
    public var rules: [CombineFormFieldRule] {
        [self.required]
    }
    
    public var keyboardType: UIKeyboardType {
        .numberPad
    }
    
    
    func formattedAddress(mac: String?) -> String? {
        guard let number = mac?.stripPhoneNumberFormatting else { return nil }
        let mask = "########-#"
        var result = ""
        var index = number.startIndex
        for ch in mask where index < number.endIndex {
            if ch == "#" {
                result.append(number[index])
                index = number.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }
    
    struct MaskedRequiredRule: CombineFormFieldRule {
        
        var notValidMessage: String {
            "Required"
        }
        var priority: Int {
            10
        }
        
        func validate(text: String) -> Bool {
            !text.isEmpty
        }
    }
}

extension String {
    var stripPhoneNumberFormatting: String {
        return self.filter("01234567890.".contains)
    }
    
    static func format(_ value: String, with mask: String, replacingCharacter character: String.Element) -> String {
        let numbers = value.stripPhoneNumberFormatting
        var result = ""
        var index = numbers.startIndex
        
        for ch in mask where index < numbers.endIndex {
            if ch == character {
                result.append(numbers[index])
                index = numbers.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }
}
