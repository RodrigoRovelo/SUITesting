//
//  ErrorModifier.swift
//  SUITestingProject
//
//  Created by rodrigorovelo on 7/13/23.
//

import CombineForms
import SwiftUI

struct ErrorModifier: ViewModifier {
    @Binding var formField: CombineFormField?
    
    private var isShowingError: Bool {
        (formField?.isValid == false) && (formField?.error.isEmpty == false)
    }
    
    func body(content: Content) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            content
            
            if isShowingError {
                errorLabel
            }
        }
    }
    
    private var errorLabel: some View {
        HStack(spacing: 4) {
            Image(systemName: "chevron")
                .renderingMode(.template)
            Text(formField?.error ?? "")
                .fixedSize(horizontal: false, vertical: true)
        }
        .foregroundColor(Color.red)
    }
}

extension View {
    func errorField(_ formfield: Binding<CombineFormField?>) -> some View {
        self.modifier(ErrorModifier(formField: formfield))
    }
}
