//
//  MMCustomPhoneTextField.swift
//  SUITestingProject
//
//  Created by APPLAUDO on 4/21/22.
//

import Foundation
import PhoneNumberKit

class MMCustomPhoneTextField: PhoneNumberTextField {
    let region: String
    
    init(defaultRegion: String) {
        region = defaultRegion
        super.init()
    }
    
    required init(coder aDecoder: NSCoder) {
        region = "US"
        super.init(coder: aDecoder)
    }
    
    override var defaultRegion: String {
        get
        {
            return region
        }
        set {}
    }
}
