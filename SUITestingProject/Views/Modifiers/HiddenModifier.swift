//
//  HiddenModifier.swift
//  SUITestingProject
//
//  Created by rodrigorovelo on 7/13/23.
//

import SwiftUI

struct HiddenModifier: ViewModifier {
    let isHidden: Bool
    
    func body(content: Content) -> some View {
        if isHidden {
            EmptyView()
        } else {
            content
        }
    }
}

extension View {
    func isHidden(_ isHidden: Bool) -> some View {
        self.modifier(HiddenModifier(isHidden: isHidden))
    }
}
