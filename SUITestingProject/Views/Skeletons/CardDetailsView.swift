//
//  CardDetailsView.swift
//  SUITestingProject
//
//  Created by Rodrigo Rovelo on 6/9/22.
//

import SwiftUI

struct CardDetailsView: View {
    let cards: [CardType]
    
    var body: some View {
        GeometryReader { reader in
            ScrollView(.horizontal) {
                HStack {
                    ForEach(cards, id: \.self) { cardDetail in
                        CreditCardView(card: cardDetail)
                            .frame(minWidth: reader.size.width)
                    }
                }
            }
            .frame(minWidth: 250)
        }
    }
}

struct CardDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CardDetailsView(cards: [CardType.titleHightlight(card: .titleHighlight)])
    }
}
