//
//  SplashScreen.swift
//  SUITestingProject
//
//  Created by Rodrigo Rovelo on 12/14/22.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        GeometryReader { proxy in
            VStack {
                Spacer()
                
                Image(uiImage: UIImage(named: "Logo") ?? UIImage())
                    .resizable()
                    .scaledToFit()
                    .frame(width: proxy.size.width/2, height: proxy.size.height * 0.08)
                    .foregroundColor(.white)
                
                Spacer()
            }
            .frame(minWidth: proxy.size.width)
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
