//
//  InteractiveGestureView.swift
//  Flashzilla
//
//  Created by Deepankar Das on 06/12/25.
//

import SwiftUI

struct InteractiveGestureView: View {
    var body: some View {
        ZStack{
            Rectangle().fill(.blue)
                .frame(width: 300, height: 300)
                .onTapGesture {
                    print("Rectangle tapped!")
                }
            Circle().fill(.red)
                .frame(width: 300, height: 300)
                .onTapGesture {
                    print("Circle tapped!")
                }
//                .allowsHitTesting(false) // disable Circle tap gesture
                .contentShape(.rect) // now out circle also tap gesture work within rectangel area.
        }
        VStack {
            Text("Hello")
            Spacer().frame(height: 100)
            Text("World")
        }
        .contentShape(.rect) // with this entire Vstack enables Tap gestures otherwise only Texts are working with tap gestures
        .onTapGesture {
            print("VStack tapped!")
        }
    }
}

#Preview {
    InteractiveGestureView()
}
