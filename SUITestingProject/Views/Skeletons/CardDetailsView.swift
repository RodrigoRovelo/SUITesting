//
//  CardDetailsView.swift
//  SUITestingProject
//
//  Created by Rodrigo Rovelo on 6/9/22.
//

import SwiftUI

struct CardDetailsView: View {
    let cardDetail: CardDetail
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            VStack(spacing: 16) {
                Capsule(style: .circular)
                    .frame(width: 50, height: 2)
                    .foregroundColor(Color.white)
                
                VStack(alignment: .leading, spacing: 16) {
                Text(cardDetail.title)
                    .font(.title2.bold())
                    .foregroundColor(.white.opacity(0.7))
                Text(cardDetail.quantity)
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity)
            }
            
            HStack {
                VStack(spacing: 4) {
                    Text(cardDetail.leftSubtitle)
                        .font(.body.bold())
                        .foregroundColor(.white)
                    Text(cardDetail.leftDetail)
                        .font(.title.bold())
                        .foregroundColor(.white)
                }
                Spacer()
                
                VStack(spacing: 12) {
                    Text(cardDetail.rightSubtitle)
                        .font(.headline)
                        .foregroundColor(.white)
                    HStack {
                        Image(systemName: "circle.fill")
                            .foregroundColor(.green)
                        Text(cardDetail.rightDate)
                            .font(.body.bold())
                            .foregroundColor(.white)
                    }
                }
            }
            
        }
        .padding()
        .background(Color(cgColor: UIColor.brightBlue.cgColor))
        .cornerRadius(20)
    }
}

struct CardDetail: Hashable {
    let title: String
    let quantity: String
    let rightSubtitle: String
    let rightDate: String
    let leftSubtitle: String
    let leftDetail: String
}

extension CardDetail {
    static let `default` = CardDetail(title: "Credito disponible", quantity: "$4,000.00", rightSubtitle: "Cuota: $120.00", rightDate: "Vence 28/02/2022", leftSubtitle: "Saldo de credito", leftDetail: "$1,260.00")
}

struct CardDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CardDetailsView(cardDetail: .default)
    }
}
