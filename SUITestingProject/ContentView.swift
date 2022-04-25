//
//  ContentView.swift
//  SUITestingProject
//
//  Created by APPLAUDO on 4/20/22.
//

import SwiftUI
import CombineForms
import Combine
import AnyFormatKitSwiftUI
import Localazy_iOS

struct ContentView: View {
    @ObservedObject var vm = RegistrationViewModel()
    
    var body: some View {

        TextFieldWithErrors(field: vm.$email)
        TextFieldWithErrors(field: vm.$phoneNumber)
        //TextFieldWithErrors(field: vm.$dui)
        //TextFieldWithErrors(field: vm.$dui, mask: "########-#")
        TextFieldWithErrors(field: vm.$dui, mask: "# #### ####")
        //MSTextField(title: "Title", placeholder: "Titulo", text: $vm.dui, mask: DuiMask())
//        TextField("Test", text: $vm.prueba)
//            .onReceive(vm.$prueba.removeDuplicates(), perform: { value in
//                self.text = String.format("#######-#", with: value, replacingCharacter: "#")
//                print(text)
//            })
        Text(localazyKey: "Hello")
        Text("Si Señor".localazyLocalized)

        Button(action: {
            print("Yes daddy")
        }, label: {
            Text("Continue!")
        })
        .disabled(!vm.formValid)
        
        Button(action: {
            vm.$dui.error = "Error de dui"
        }, label: {
            Text("Test custom error")
        })
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

struct TextFieldWithErrors: View {
    @ObservedObject var field: CombineFormField
    @State var mask: String?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            if mask == nil {
                TextField(field.label, text: $field.value)
                    .textFieldStyle(.roundedBorder)
            } else {
                FormatTextField(
                    unformattedText: $field.value,
                    placeholder: field.label,
                    textPattern: mask ?? ""
                ).borderStyle(.roundedRect)
            }
            Label(field.error, systemImage: "")
                .foregroundColor(Color.red)

        }
        .padding(20)
    }
}
