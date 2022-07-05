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
    @StateObject var viewModel = SkeletonViewModel()
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                VStack(spacing: 8) {
                    Text("Hola, Valeria")
                        .font(.headline)
                        .foregroundColor(.white)
                    Text("Inicio")
                        .font(.title.bold())
                        .foregroundColor(.white)
                }
                
                topCarrousel
                    .offset(CGSize(width: 0, height: dragOffset.height * 1.5))
                
                productsCarrousel
                
                bottomCarrousel
                    .offset(CGSize(width: 0, height: dragOffset.height * -1))
                
                GeometryReader { gr in
                    graphView
                        .position(x: gr.size.width/2, y: gr.size.height + 200)
                        .offset(CGSize(width: 0, height: dragOffset.height * 3))
                }
            }
            
            if show {
                DetailView(namespace: namespace, show: $show)
            }
        }
        .animation(.spring(), value: dragOffset)
        .background(.black)
        .onLoad(perform: viewModel.fetch)
    }
    
    var topCarrousel: some View {
        OptionsView(optionsDetails: viewModel.optionsDetails)
            .padding([.leading])
            .matchedGeometryEffect(id: "topCarrousel", in: namespace)
            .redacted(reason: viewModel.isLoading ? .placeholder : [])
    }
    
    var productsCarrousel: some View {
        //CourseItem(namespace: namespace, state: $show)
        CardDetailsView(cards: viewModel.cardDetails)
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
            .padding([.leading])
            .matchedGeometryEffect(id: "productCarrousel", in: namespace)
            .redacted(reason: viewModel.isLoading ? .placeholder : [])
    }
    
    var bottomCarrousel: some View {
        Text("Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.")
            .background(Color.cyan)
            .padding(20)
            .matchedGeometryEffect(id: "bottomCarrousel", in: namespace)
    }
    
    var graphView: some View {
        Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
            .frame(maxWidth: .infinity)
            .background(.mint)
            .foregroundColor(.black)
            .padding(20)
            .matchedGeometryEffect(id: "graph", in: namespace)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
