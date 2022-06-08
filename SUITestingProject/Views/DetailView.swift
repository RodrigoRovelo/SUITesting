//
//  DetailView.swift
//  SUITestingProject
//
//  Created by Rodrigo Rovelo on 6/7/22.
//

import SwiftUI

struct DetailView: View {
    var namespace: Namespace.ID
    @Binding var show: Bool
    
    var body: some View {
        ZStack {
            ScrollView {
                CourseItem(namespace: namespace, state: $show)
                    //.frame(height: 250)
                    .matchedGeometryEffect(id: "productCarrousel", in: namespace)
                
                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                    .frame(maxWidth: .infinity)
                    //.animation(.easeIn, value: show)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(20)
            
            Button {
                withAnimation {
                    show.toggle()
                }
            } label: {
                Image(systemName: "xmark")
            }
            .frame(alignment: .topTrailing)
            .foregroundColor(Color.black)
            .padding(8)
            .ignoresSafeArea()
            
            GeometryReader { gr in
                Text("Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.")
                    .background(Color.red)
                    .padding(20)
                    .matchedGeometryEffect(id: "topCarrousel", in: namespace)
                    .frame(width: gr.size.width, height: gr.size.height)
                    .position(x: gr.size.width/2, y: -500)
            }
            
            
            GeometryReader { gr in
                Text("Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.")
                    .background(Color.cyan)
                    .padding(20)
                    .matchedGeometryEffect(id: "bottomCarrousel", in: namespace)
                    .frame(width: gr.size.width, height: gr.size.height)
                    .position(x: gr.size.width/2, y: gr.size.height + 500)
            }
        }
        .background(Color.orange)
    }
}

struct DetailView_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        DetailView(namespace: namespace, show: .constant(true))
    }
}
