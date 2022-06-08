//
//  ContentView.swift
//  SUITestingProject
//
//  Created by APPLAUDO on 4/20/22.
//

import SwiftUI
import CombineForms
import Combine
import Applanga

struct ContentView: View {
    @ObservedObject var vm = RegistrationViewModel()
    @State private var name = "Taylor"
    
    var body: some View {

        TextField("Enter your name", text: $name)
            .textFieldStyle(.roundedBorder)
            .keyboardType(.numberPad)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Click me!") {
                        print("Clicked")
                    }
                }
            }
        
        TextFieldWithErrors(field: vm.$email)
            .onAppear(perform: {
                
            })
        TextFieldWithErrors(field: vm.$phoneNumber, onEditingChanged: { (isEditing) in
            if (!isEditing) {
                vm.$phoneNumber.validate()
            }
        })
        //TextFieldWithErrors(field: vm.$dui)
        //TextFieldWithErrors(field: vm.$dui, mask: "########-#")
        TextFieldWithErrors(field: vm.$dui, mask: $vm.mask.wrappedValue)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Next") {
                        print("Next Clicked")
                    }
                }
            }
        
//        TextField("text", text: $vm.dui)
//            .onReceive(vm.$dui.publisher) { (c) in
//                        print("Got \(c)")
//                self.vm.dui = self.vm.dui.uppercased()
//            }
        //MSTextField(title: "Title", placeholder: "Titulo", text: $vm.dui, mask: DuiMask())
//        TextField("Test", text: $vm.prueba)
//            .onReceive(vm.$prueba.removeDuplicates(), perform: { value in
//                self.text = String.format("#######-#", with: value, replacingCharacter: "#")
//                print(text)
//            })
        Text(Applanga.localizedString(forKey: "Hello", withDefaultValue: "Hallo"))
        Text(Applanga.localizedString(forKey: "Si Señor", withDefaultValue: "no hay"))
        Text(Applanga.localizedString(forKey: "Prueba", withDefaultValue: "Hallo"))

        Button(action: {
            print("Yes daddy")
        }, label: {
            Text("Continue!")
        })
        .disabled(!vm.formValid)
        
        Button(action: {
            
            vm.changeDocument(vm.isDui)
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
    var onEditingChanged: (Bool) -> Void = { (editing) in }
    
    //Input view
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            if mask == nil {
                TextField(field.label, text: $field.value, onEditingChanged: onEditingChanged)
                    .textFieldStyle(.roundedBorder)
            } else {
                MMMaskedTextField(unformattedText: $field.value,
                                  placeholder: field.label,
                                  textPattern: field.label)
                .setMask(mask ?? "")
                .textFieldStyle(.roundedBorder)
//                FormatTextField(
//                    unformattedText: $field.value,
//                    placeholder: field.label,
//                    textPattern: mask ?? ""
//                ).borderStyle(.roundedRect)
                    
            }
            Label(field.error, systemImage: "")
                .foregroundColor(Color.red)

        }
        .padding(20)
    }
}
