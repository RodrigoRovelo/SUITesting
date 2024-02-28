//
//  String+Extensions.swift
//  SUITestingProject
//
//  Created by rodrigorovelo on 7/13/23.
//

import Foundation

extension String {
    var onlyNumbersAndDecimal: String {
        return self.filter("1234567890.".contains)
    }
}
