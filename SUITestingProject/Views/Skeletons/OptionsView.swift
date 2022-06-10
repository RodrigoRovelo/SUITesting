//
//  OptionsView.swift
//  SUITestingProject
//
//  Created by Rodrigo Rovelo on 6/9/22.
//

import SwiftUI

struct OptionsView: View {
    let optionsDetail: OptionsDetail
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 16) {
                Text(optionsDetail.title)
                Button {

                } label: {
                    Text(optionsDetail.buttonTitle)
                }
            }

            Image(systemName: "star.fill")
                .resizable()
                .frame(width: 75, height: 75, alignment: .bottom)
        }
        .padding()
        .background(Color(cgColor: UIColor.darkBlue.cgColor))
        .cornerRadius(20)
    }
}

struct OptionsDetail: Hashable {
    let title: String
    let buttonTitle: String
}

extension OptionsDetail {
    static let `default` = OptionsDetail(title: "Beneficios\nexclusivos",
                                         buttonTitle: "Explorar")
}

struct OptionsView_Previews: PreviewProvider {
    static var previews: some View {
        OptionsView(optionsDetail: .default)
    }
}
