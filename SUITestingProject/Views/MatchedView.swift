//
//  MatchedView.swift
//  SUITestingProject
//
//  Created by Rodrigo Rovelo on 6/7/22.
//

import SwiftUI

struct MatchedView: View {
    @Namespace var namespace
    @State var show = false
    
    var body: some View {
        ZStack {
            
            ScrollView {
                Text("Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.")
                    .background(Color.red)
                
                CourseItem(namespace: namespace, state: $show)
                    .onTapGesture {
                        withAnimation {
                            show.toggle()
                        }
                    }
                
                Text("Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.")
                    .background(Color.cyan)
            }
            
            if show {
                DetailView(namespace: namespace, show: $show)
            }
        }
        
    }
}

struct MatchedView_Previews: PreviewProvider {
    static var previews: some View {
        MatchedView()
    }
}
