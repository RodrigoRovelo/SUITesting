//
//  MMPhoneTextField.swift
//  SUITestingProject
//
//  Created by APPLAUDO on 4/21/22.
//

import SwiftUI

struct MMMaskedTextField: UIViewRepresentable {
    // MARK: - Data
    private let placeholder: String?
    private var maskString: String
    private var patternSymbol: Character
    @Binding public var unformattedText: String

    private var formatter: TextInputFormatter
    
    /// Will init with DefaultTextInputFormatter
    public init(unformattedText: Binding<String>,
                placeholder: String? = nil,
                textPattern: String,
                patternSymbol: Character = "#") {
        self._unformattedText = unformattedText
        self.placeholder = placeholder
        self.maskString = textPattern
        self.patternSymbol = patternSymbol
        self.formatter = TextInputFormatter(textPattern: textPattern, patternSymbol: patternSymbol)
    }
    
    public func makeUIView(context: Context) -> UITextField {
        let uiView = UITextField()
        uiView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        uiView.delegate = context.coordinator
        context.coordinator.formatter = formatter
        return uiView
    }
    
    public func updateUIView(_ uiView: UITextField, context: Context) {
        let formattedText = formatter.format(unformattedText, textPattern: maskString)
        if uiView.text != formattedText {
            uiView.text = formattedText
        }
        uiView.placeholder = placeholder
    }
    
    public func makeCoordinator() -> Coordinator {
        let coordinator = Coordinator(unformattedText: $unformattedText)
        return coordinator
    }
}

class Coordinator: NSObject, UITextFieldDelegate {
    
    let unformattedText: Binding<String>?
    
    var formatter: TextInputFormatter?
    
    init(unformattedText: Binding<String>) {
        self.unformattedText = unformattedText
    }
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let formatter = formatter else { return true }

        let result = formatter.formatInput(
            currentText: textField.text ?? "",
            range: range,
            replacementString: string
        )
        textField.text = result.formattedText
        textField.setCursorLocation(result.caretBeginOffset)
        self.unformattedText?.wrappedValue = formatter.unformat(result.formattedText) ?? ""
        return false
    }
}

extension UITextField {
    
    func setCursorLocation(_ location: Int) {
        guard let cursorLocation = position(from: beginningOfDocument, offset: location) else { return }
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.selectedTextRange = strongSelf.textRange(from: cursorLocation, to: cursorLocation)
        }
    }
}

extension MMMaskedTextField {
    func setMask(_ mask: String) -> MMMaskedTextField {
        var view: MMMaskedTextField = self
        view.maskString = mask
        
        return view
    }
}
