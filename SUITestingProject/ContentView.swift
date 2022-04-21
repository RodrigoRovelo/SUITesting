//
//  ContentView.swift
//  SUITestingProject
//
//  Created by APPLAUDO on 4/20/22.
//

import SwiftUI
import CombineForms

struct ContentView: View {
    @ObservedObject var vm = RegistrationViewModel()
    
    var body: some View {

        TextFieldWithErrors(field: vm.$email)
        TextFieldWithErrors(field: vm.$phoneNumber)

        Button(action: {
            print("Yes daddy")
        }, label: {
            Text("Continue!")
        })
        .disabled(!vm.formValid)
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

struct TextFieldWithErrors: View {
    @ObservedObject var field: CombineFormField
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            TextField(field.label, text: $field.value)
                .foregroundColor(field.isValid ? Color.green : Color.red)
                .textFieldStyle(.roundedBorder)
            Label(field.error, systemImage: "")
                .foregroundColor(Color.red)
        }
        .padding(20)
    }
}
