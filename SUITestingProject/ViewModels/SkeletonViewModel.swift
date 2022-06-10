//
//  SkeletonViewModel.swift
//  SUITestingProject
//
//  Created by Rodrigo Rovelo on 6/9/22.
//

import Foundation

class SkeletonViewModel: ObservableObject {
    @Published private(set) var optionsDetails: [OptionsDetail]
    @Published private(set) var cardDetails: [CardDetail]
    @Published private(set) var isLoading = true
    
    init(optionsDetails: [OptionsDetail] = Array(repeating: .default, count: 2),
         cardDetails: [CardDetail] = Array(repeating: .default, count: 3)) {
        self.optionsDetails = optionsDetails
        self.cardDetails = cardDetails
    }
    
    func fetch() {
        DispatchQueue.global(qos: .userInteractive).asyncAfter(deadline: .now() + 5) { [weak self] in
            DispatchQueue.main.async {
                self?.isLoading = false
            }
        }
    }
}
