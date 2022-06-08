//
//  CourseItem.swift
//  SUITestingProject
//
//  Created by Rodrigo Rovelo on 6/7/22.
//

import SwiftUI

struct CourseItem: View {
    var namespace: Namespace.ID
    @Binding var state: Bool
    
    var body: some View {
        
        HStack {
            VStack {
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.purple)
            .blur(radius: 8)
            .overlay {
                VStack {
                    Text("Smart Dolares")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("$3000")
                        .font(.title.weight(.bold))
                    
                    Text("Ganancias")
                        .frame(alignment: .leading)
                    
                    HStack {
                        Text("Colones")
                        Spacer()
                        Text("$9.28 este mes")
                    }
                }
                .padding()
            }
        }
        .frame(height: 250)
    }
}

struct CourseItem_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        CourseItem(namespace: namespace, state: .constant(true))
    }
}
