//
//  SuccessView.swift
//  SuccessAnimation
//
//  Created by Tatsuya Kaneko on 26/03/2022.
//

import SwiftUI

struct SuccessView: View {
    @State private var circlePercentage = 0.0
    @State private var checkMarkOffset = -100.0
    @State private var textOpacity = 0.0
    let message: String
    let onAnimationCompleted: (() -> ())?
    
    init(message: String, onAnimationCompleted: (() -> ())? = nil) {
        self.message = message
        self.onAnimationCompleted = onAnimationCompleted
    }
    
    var body: some View {
        VStack(spacing: 24.0) {
            Circle()
                .trim(from: 0.0, to: circlePercentage)
                .rotation(.init(degrees: -90))
                .stroke(lineWidth: 12.0)
                .foregroundColor(.green)
                .frame(width: 200, height: 200)
                .overlay {
                    Image(systemName: "checkmark")
                        .font(.system(size: 100))
                        .foregroundColor(.green)
                        .clipShape(Rectangle().offset(x: checkMarkOffset))
                }
            
            Text(message)
                .foregroundColor(.green)
                .font(.title)
                .fontWeight(.bold)
                .opacity(textOpacity)
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 1.0)) {
                circlePercentage = 1.0
            }
            withAnimation(.easeInOut(duration: 1.0)) {
                textOpacity = 1.0
            }
            withAnimation(.easeInOut(duration:0.5).delay(1.0)) {
                checkMarkOffset = 0
            }
        }
        .onAnimationCompleted(for: checkMarkOffset) {
            onAnimationCompleted?()
        }
    }
}

struct LoginSuccessVView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            SuccessView(
                message: "You are logged in!",
                onAnimationCompleted: {}
            )
        }
    }
}
