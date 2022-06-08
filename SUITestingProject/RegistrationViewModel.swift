//
//  ViewModel.swift
//  SUITestingProject
//
//  Created by APPLAUDO on 4/21/22.
//

import Foundation
import CombineForms
import Combine
import Applanga

class RegistrationViewModel: ObservableObject, CombineFormValidating {

    @CombineFormField(configuration: MMEmailFieldConfiguration(), label: "name@email", validator: DefaultValidator(errorStrategy: .highestPriority)) var email = ""
    @CombineFormField(configuration: MMPhoneNumberFieldConfiguration(), label: "phoneNumber", debounceTime: 0.5) var phoneNumber = ""
    @CombineFormField(configuration: MMMaskedConfiguration(mask: "# #### ####"), label: "0 0000 0000") var dui = ""
    
    @Published var formValid: Bool = false
    @Published var formErrors: String = ""
    @Published var mask = "# #### ####"
    
    lazy var fields: [CombineFormField] = [$email, $phoneNumber]
    var cancellables = Set<AnyCancellable>()
    var isDui = true


    init() {
        activateForm()
    }
    
    func changeDocument(_ isDui: Bool) {
        if isDui {
            mask = "########-#"
            $dui.configuration = MMMaskedConfiguration(mask: mask)
            $dui.label = "00000000-0"
        } else {
            mask = "# #### ####"
            $dui.configuration = MMMaskedConfiguration(mask: mask)
            $dui.label = "0 0000 0000"
        }
        self.isDui.toggle()
    }
}
