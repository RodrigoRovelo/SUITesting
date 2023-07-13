//
//  InformationCard.swift
//  SUITestingProject
//
//  Created by Rodrigo Rovelo on 7/21/22.
//

import Foundation

struct InformationCard: Hashable {
    let title: String
    let description: String
    let actionTitle: String
}

extension InformationCard {
    static let `default` = InformationCard(title: "Credito pre aprobado",
                                           description: "!Podes solicitar\n $25,000 hoy mismo!",
                                           actionTitle: "Solicitar")
    static let titleHighlight = InformationCard(title: "Conoce nuestras opciones de\ncrédito",
                                                description: "Comunicate con nosotros para brindarte más información de solicitud de crédito.",
                                                actionTitle: "Contactar a un asesor")
    static let approvedCredit = InformationCard(title: "Credito disponible",
                                                description: "$5,000",
                                                actionTitle: "Desembolsar credito")
}
