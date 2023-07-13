//
//  CreditCardView.swift
//  SUITestingProject
//
//  Created by Rodrigo Rovelo on 6/10/22.
//

import SwiftUI

struct CreditCardView: View {
    let card: CardType
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(cgColor: UIColor.brightBlue.cgColor), Color(cgColor: UIColor.brightBlue.cgColor).opacity(0)]), startPoint: .bottomLeading, endPoint: .topTrailing)
                .blur(radius: 8)
            
            GeometryReader { reader in
                VStack(alignment: .leading, spacing: 24) {
                    VStack(spacing: 16) {
                        Capsule(style: .circular)
                            .frame(width: reader.size.width * 0.21, height: 4)
                            .foregroundColor(Color.white)
                    }
                    .frame(maxWidth: .infinity)
                    
                    contenido
                }
            }
            .padding()
        }
        .cornerRadius(20)
    }
    
    @ViewBuilder
    var contenido: some View {
        switch card {
        case .offer(let card):
            creditoDisponible(card)
        case .descriptionHighlight(let card):
            descriptionHighlight(card)
        case .titleHightlight(let card):
            titleHightlight(card)
        case .creditInProcess(let card):
            inProcess(card)
        case .approvedCredit(let card):
            approvedCredit(card)
        }
    }
    
    @ViewBuilder
    func approvedCredit(_ card: InformationCard) -> some View {
        VStack(alignment: .leading, spacing: 12){
            HStack(spacing: 5) {
                Image(systemName: "checkmark.circle")
                    .foregroundColor(.white)
                Text(card.title)
                    .font(.title3.bold())
                    .foregroundColor(.white)
            }
            .padding([.leading, .trailing], 12)
            .padding([.bottom, .top], 5)
            .background(.gray)
            .cornerRadius(16)
            
            Text(card.description)
                .font(.largeTitle.bold())
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)
        }
        
        Spacer()
        
        VStack(spacing: 4) {
            Image(systemName: "chevron.up")
                .foregroundColor(.white)
            Text(card.actionTitle)
                .font(.body)
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity)
    }
    
    @ViewBuilder
    func inProcess(_ card: InProcessCard) -> some View {
        VStack(alignment: .leading, spacing: 12){
            HStack(spacing: 5) {
                Image(systemName: "info.circle")
                    .foregroundColor(.white)
                Text(card.title)
                    .font(.title3.bold())
                    .foregroundColor(.white)
            }
            .padding([.leading, .trailing], 12)
            .padding([.bottom, .top], 5)
            .background(.gray)
            .cornerRadius(16)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(card.subtitle)
                    .font(.title2.bold())
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                Text(card.description)
                    .font(.body)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
            }
        }
        
        Spacer()
        
        VStack(spacing: 4) {
            Image(systemName: "chevron.up")
                .foregroundColor(.white)
            Text(card.actionTitle)
                .font(.body)
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity)
    }
    
    @ViewBuilder
    func titleHightlight(_ card: InformationCard) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(card.title)
                .font(.title2.bold())
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)
            Text(card.description)
                .font(.body)
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)
        }
        
        Spacer()
        
        VStack(spacing: 4) {
            Image(systemName: "chevron.up")
                .foregroundColor(.white)
            Text(card.actionTitle)
                .font(.body)
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity)
    }
    
    @ViewBuilder
    func descriptionHighlight(_ card: InformationCard) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(card.title)
                .font(.title3.bold())
                .foregroundColor(.white.opacity(0.7))
                .multilineTextAlignment(.leading)
            Text(card.description)
                .font(.title.bold())
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)
        }
        
        Spacer()
        
        VStack(spacing: 4) {
            Image(systemName: "chevron.up")
                .foregroundColor(.white)
            Text(card.actionTitle)
                .font(.body)
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity)
    }
    
    @ViewBuilder
    func creditoDisponible(_ card: OfferCard) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(card.title)
                .font(.title2.bold())
                .foregroundColor(.white.opacity(0.7))
                .multilineTextAlignment(.leading)
            Text(card.description)
                .font(.largeTitle.bold())
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)
        }
        
        VStack(alignment: .trailing, spacing: 4){
            ProgressView(value: 750, total: 1000)
                .progressViewStyle(.linear)
                .background(.black)
                .foregroundColor(.green)
            
            Text(card.secondDescription)
                .foregroundColor(.white)
        }
        
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text("Cuota")
                    .font(.headline)
                    .foregroundColor(.white)
                
                HStack(spacing: 8) {
                    Text(card.quota ?? "")
                        .font(.headline)
                        .foregroundColor(.white)
                    Image(systemName: "plus")
                        .foregroundColor(.green)
                    Text(card.secondQuota ?? "")
                        .font(.headline)
                        .foregroundColor(.white)
                }
            }
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Vence")
                    .font(.body.bold())
                    .foregroundColor(.white)
                
                HStack {
                    Image(systemName: "circle.fill")
                        .foregroundColor(.green)
                    Text(card.expirationDate ?? "")
                        .foregroundColor(.white)
                }
                .padding(9)
                .background(.gray)
                .cornerRadius(16)
            }
        }
    }
}

enum CardType: Hashable {
    case offer(card: OfferCard)
    case descriptionHighlight(card: InformationCard)
    case titleHightlight(card: InformationCard)
    case creditInProcess(card: InProcessCard)
    case approvedCredit(card: InformationCard)
}

struct CreditCardView_Previews: PreviewProvider {
    static var previews: some View {
        //CreditCardView(card: CardType.descriptionHighlight(card: .default))
        //CreditCardView(card: CardType.offer(card: .default))
        //CreditCardView(card: CardType.titleHightlight(card: .titleHighlight))
        //CreditCardView(card: CardType.creditInProcess(card: .default))
        CreditCardView(card: CardType.approvedCredit(card: .approvedCredit))
    }
}

struct InformationCard: Hashable {
    let title: String
    let description: String
    let actionTitle: String
}

extension InformationCard {
    static let approvedCredit: InformationCard = {
       InformationCard(title: "titulo", description: "description", actionTitle: "action")
    }()
    
    static let titleHighlight: InformationCard = {
        InformationCard(title: "titulo", description: "description", actionTitle: "action")
    }()
}

struct OfferCard: Hashable {
    let title: String
    let description: String
    let secondDescription: String
    let quota: String
    let secondQuota: String
    let expirationDate: String
}

extension OfferCard {
    static let `default`: OfferCard = {
       OfferCard(
        title: "Titulo",
        description: "Description",
        secondDescription: "Second",
        quota: "$50",
        secondQuota: "$80",
        expirationDate: "2022-11-20"
       )
    }()
}

struct InProcessCard: Hashable {
    let title: String
    let subtitle: String
    let description: String
    let actionTitle: String
}
