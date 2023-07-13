//
//  MainCoordinator.swift
//  SUITestingProject
//
//  Created by Rodrigo Rovelo on 12/14/22.
//

import SwiftUI

struct MainCoordinator: View {
    var body: some View {
        ZStack {
            backgroundColor
            
            route
        }
    }
    
    @ViewBuilder
    var route: some View {
        if true {
            UserCoordinator()
        }
    }
    
    var backgroundColor: some View {
        Color(.black)
            .ignoresSafeArea(.all)
    }
}

struct MainCoordinator_Previews: PreviewProvider {
    static var previews: some View {
        MainCoordinator()
    }
}
