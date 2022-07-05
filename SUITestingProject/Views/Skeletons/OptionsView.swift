//
//  OptionsView.swift
//  SUITestingProject
//
//  Created by Rodrigo Rovelo on 6/9/22.
//

import SwiftUI

struct OptionsView: View {
    let optionsDetails: [OptionsDetail]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(optionsDetails, id: \.self) { newDetail in
                    OptionsCardView(optionsDetail: newDetail)
                        .aspectRatio(1.5, contentMode: .fit)
                }
            }
        }
    }
}

struct OptionsCardView: View {
    let optionsDetail: OptionsDetail
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: .init(colors: [Color(cgColor: UIColor.borderColor.cgColor), Color(cgColor: UIColor.borderColor.cgColor).opacity(0)]), startPoint: .topTrailing, endPoint: .bottomLeading)
            
            Color(.black)
                .cornerRadius(20)
                .padding(1)
            Color(cgColor: UIColor.darkBlue.cgColor)
                .cornerRadius(20)
                .padding(1)
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundColor(.orange)
                        .frame(width: 75, height: 75)
                }
            }
            .blur(radius: 20)
            
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(optionsDetail.title)
                            .foregroundColor(.white)
                            .font(.headline.bold())
                            //.frame(maxWidth: .infinity)
                            //.multilineTextAlignment(.leading)
                        
                        Text(optionsDetail.buttonTitle)
                            .font(.caption)
                            .foregroundColor(.orange)
                    }
                    Spacer()
                }
                Spacer()
            }
            .padding()
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundColor(.orange)
                        .frame(width: 75, height: 75)
                }
            }
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundColor(.orange)
                        .frame(width: 75, height: 75)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
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
        OptionsCardView(optionsDetail: .default)
    }
}
