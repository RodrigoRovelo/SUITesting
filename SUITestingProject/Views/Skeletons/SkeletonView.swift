//
//  SkeletonView.swift
//  SUITestingProject
//
//  Created by Rodrigo Rovelo on 6/8/22.
//

import SwiftUI

struct SkeletonView: View {
    @StateObject var skeletonViewModel = SkeletonViewModel()
    
    var body: some View {
        VStack(spacing: 24) {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(skeletonViewModel.optionsDetails, id: \.self) { newDetail in
                        OptionsView(optionsDetail: newDetail)
                    }
                }
            }
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(skeletonViewModel.cardDetails, id: \.self) { newDetail in
                        CardDetailsView(cardDetail: newDetail)
                    }
                }
            }
            
            Spacer()
        }
        .padding([.leading])
        .onLoad(perform: skeletonViewModel.fetch)
        .redacted(reason: skeletonViewModel.isLoading ? .placeholder : [])
        
    }
}

struct SkeletonView_Previews: PreviewProvider {
    static var previews: some View {
        SkeletonView()
    }
}
