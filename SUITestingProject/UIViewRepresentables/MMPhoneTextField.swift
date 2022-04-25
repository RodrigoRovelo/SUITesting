//
//  MMPhoneTextField.swift
//  SUITestingProject
//
//  Created by APPLAUDO on 4/21/22.
//

import SwiftUI
import PhoneNumberKit

struct MMPhoneTextField: UIViewRepresentable {
    let region: String
    @Binding var text: String

    func makeUIView(context: Context) -> PhoneNumberTextField {
        MMCustomPhoneTextField(defaultRegion: region)
    }

    func updateUIView(_ uiView: PhoneNumberTextField, context: Context) {
        uiView.text = text
    }
}
