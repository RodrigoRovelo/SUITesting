//
//  OfferCard.swift
//  SUITestingProject
//
//  Created by Rodrigo Rovelo on 7/21/22.
//

import Foundation

struct OfferCard: Hashable {
    let title: String
    let description: String
    let secondDescription: String
    let quota: String?
    let secondQuota: String?
    let expirationDate: String?
}

extension OfferCard {
    static let `default` = OfferCard(title: "Disponible", description: "$4,000.00", secondDescription: "Saldo $4,100 de $5,000", quota: "$80", secondQuota: "$5,000", expirationDate: "28/02/2022")
}
