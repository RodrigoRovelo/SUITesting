//
//  InProcessCard.swift
//  SUITestingProject
//
//  Created by Rodrigo Rovelo on 7/21/22.
//

import Foundation

struct InProcessCard: Hashable {
    let title: String
    let subtitle: String
    let description: String
    let actionTitle: String
}

extension InProcessCard {
    static let `default` = InProcessCard(title: "Crédito",
                                         subtitle: "Necesitamos validar tu identidad",
                                         description: "Sigue el proceso de validación de tu identidad para obtener tu crédito.",
                                         actionTitle: "Contactar")
}
