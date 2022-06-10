//
//  HomeView.swift
//  SUITestingProject
//
//  Created by Rodrigo Rovelo on 6/7/22.
//

import SwiftUI

struct HomeView: View {
    @Namespace var namespace
    @State var show = false
    @State var dragOffset = CGSize.zero
    
    var body: some View {
        ZStack {
            VStack {
                
                topCarrousel
                    .offset(CGSize(width: 0, height: dragOffset.height * 1.5))
                
                
                productsCarrousel
                
                
                bottomCarrousel
                    .offset(CGSize(width: 0, height: dragOffset.height * -1))
            }
            
            if show {
                DetailView(namespace: namespace, show: $show)
            }
        }
        .animation(.spring(), value: dragOffset)
    }
    
    var topCarrousel: some View {
        Text("Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.")
            .background(Color.red)
            .padding()
            .matchedGeometryEffect(id: "topCarrousel", in: namespace)
    }
    
    var productsCarrousel: some View {
        CourseItem(namespace: namespace, state: $show)
            .offset(dragOffset)
            .gesture(
                DragGesture(minimumDistance: 50)
                    .onChanged { value in
                        dragOffset = CGSize(width: 0, height: value.translation.height)
                        if abs(dragOffset.height) > 100 {
                            withAnimation {
                                show = true
                                
                            }
                        }
                    }
                    .onEnded { _ in
                        dragOffset = .zero
                    }
            )
            .onTapGesture {
                withAnimation {
                    show = true
                    
                }
            }
            .matchedGeometryEffect(id: "productCarrousel", in: namespace)
    }
    
    var bottomCarrousel: some View {
        Text("Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.")
            .background(Color.cyan)
            .padding(20)
            .matchedGeometryEffect(id: "bottomCarrousel", in: namespace)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
