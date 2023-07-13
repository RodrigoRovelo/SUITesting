//
//  UserCoordinator.swift
//  SUITestingProject
//
//  Created by Rodrigo Rovelo on 12/14/22.
//

import SwiftUI

struct UserCoordinator: View {
    @State var isPresenting: Bool = false
    
    var body: some View {
        Group {
            if true {
                SplashScreen()
            }
        }
        .toast(
            message: "HOla",
            isShowing: $isPresenting,
            duration: Toast.short
        )
    }
}

struct UserCoordinator_Previews: PreviewProvider {
    static var previews: some View {
        UserCoordinator()
    }
}

struct Toast {
    // these correspond to Android values f
    // or DURATION_SHORT and DURATION_LONG
    static let short: TimeInterval = 2
    static let long: TimeInterval = 3.5
    
    let message: String
    var config: ToastModifier.Config = ToastModifier.Config()
    var duration: TimeInterval = Toast.short
}

struct ToastModifier: ViewModifier {
    @Binding var isShowing: Bool
    
    let message: String
    let config: Config
    
    func body(content: Content) -> some View {
        ZStack {
            content
            toastView
        }
    }
    
    private var toastView: some View {
        VStack {
            Spacer()
            if isShowing {
                HStack {
                    Text(message)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.gray)
                        .font(.callout)
                    
                    Spacer()
                }
                .padding(8)
                .background(config.backgroundColor)
                .cornerRadius(8)
                .onTapGesture {
                    isShowing = false
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + config.duration) {
                        isShowing = false
                    }
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 18)
        .animation(config.animation, value: isShowing)
        .transition(config.transition)
    }
    
    struct Config {
        let backgroundColor: Color
        let duration: TimeInterval
        let transition: AnyTransition
        let animation: Animation
        
        init(backgroundColor: Color = .gray,
             duration: TimeInterval = Toast.short,
             transition: AnyTransition = .slide,
             animation: Animation = .linear(duration: 0.3)) {
            self.backgroundColor = backgroundColor
            self.duration = duration
            self.transition = transition
            self.animation = animation
        }
    }
}

extension View {
    func toast(message: String,
               isShowing: Binding<Bool>,
               config: ToastModifier.Config) -> some View {
        self.modifier(ToastModifier(isShowing: isShowing,
                                    message: message,
                                    config: config))
    }
    
    func toast(message: String,
               isShowing: Binding<Bool>,
               duration: TimeInterval) -> some View {
        self.modifier(ToastModifier(isShowing: isShowing,
                                    message: message,
                                    config: .init(duration: duration)))
    }
}
