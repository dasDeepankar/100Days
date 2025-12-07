//
//  AccessibilityOptionSupportView.swift
//  Flashzilla
//
//  Created by Deepankar Das on 07/12/25.
//

import SwiftUI
//accessibilityDifferentiateWithoutColor, accessibilityReduceMotion, accessibilityReduceTransparency

func withOptionalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
    if UIAccessibility.isReduceMotionEnabled {
        return try body()
    }else{
        return try withAnimation(animation, body)
    }
}
struct AccessibilityOptionSupportView: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    @State private var scaleAmount = 1.0
    var body: some View {
        HStack {
            if differentiateWithoutColor {
                Image(systemName: "checkmark.circle")
            }
            
            Text("Success")
        }
        .padding()
        .background(differentiateWithoutColor ? .black : .green)
        .foregroundStyle(.white)
        .clipShape(.capsule)
        Button("Hello, World!"){
//            if reduceMotion {
//                scaleAmount *= 1.5
//            }else {
//                withAnimation {
//                    scaleAmount *= 1.5
//                }
//            }
            withOptionalAnimation {
                scaleAmount *= 1.5
            }
            
        }.buttonStyle(.borderedProminent)
            .scaleEffect(scaleAmount)
        Text("Hello, World!")
                  .padding()
                  .background(reduceTransparency ? .black : .black.opacity(0.5))
                  .foregroundStyle(.white)
                  .clipShape(.capsule)
        
        
    }
}

#Preview {
    AccessibilityOptionSupportView()
}
