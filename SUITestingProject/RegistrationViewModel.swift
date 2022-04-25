//
//  ViewModel.swift
//  SUITestingProject
//
//  Created by APPLAUDO on 4/21/22.
//

import Foundation
import CombineForms
import Combine

class RegistrationViewModel: ObservableObject, CombineFormValidating {

    @CombineFormField(configuration: MMEmailFieldConfiguration(), label: "name@email", validator: DefaultValidator(errorStrategy: .highestPriority)) var email = ""
    @CombineFormField(configuration: MMPhoneNumberFieldConfiguration(), label: "phoneNumber") var phoneNumber = ""
    @CombineFormField(configuration: MMMaskedConfiguration(), label: "Cedula") var dui = ""
    
    @Published var formValid: Bool = false
    @Published var formErrors: String = ""
    
    lazy var fields: [CombineFormField] = [$email, $phoneNumber]
    internal var cancellables = Set<AnyCancellable>()


    init() {
        activateForm()
    }
}
