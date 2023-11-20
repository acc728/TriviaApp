//
//  LottieView.swift
//  Trivia App
//
//  Created by user242582 on 20/11/23.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    let loopMode : LottieLoopMode
    let animationName: String
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func makeUIView(context: Context) -> some UIView {
        let view = UIView(frame: .zero)
        
        let lottieAnimationView = LottieAnimationView(name: animationName)
        lottieAnimationView.contentMode = .scaleAspectFit
        lottieAnimationView.loopMode = loopMode
        lottieAnimationView.play()
        
        lottieAnimationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lottieAnimationView)
        
        NSLayoutConstraint.activate([
            lottieAnimationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            lottieAnimationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
        return view
    }
}

#Preview {
    LottieView(loopMode: .loop, animationName: "congratulations")
}
