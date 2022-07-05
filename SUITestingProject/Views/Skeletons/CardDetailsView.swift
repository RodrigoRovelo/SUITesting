//
//  CardDetailsView.swift
//  SUITestingProject
//
//  Created by Rodrigo Rovelo on 6/9/22.
//

import SwiftUI

struct CardDetailsView: View {
    let cards: [CardDetail]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(cards, id: \.self) { cardDetail in
                    CreditCardView(cardDetail: cardDetail)
                }
            }
        }
        .frame(height: 250)
    }
}

struct CardDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CardDetailsView(cards: [.default])
    }
}
