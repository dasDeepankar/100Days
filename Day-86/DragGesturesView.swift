//
//  DragGesturesView.swift
//  Flashzilla
//
//  Created by Deepankar Das on 06/12/25.
//

import SwiftUI

struct DragGesturesView: View {
    // how far the circle has been dragged
    @State private var offset = CGSize.zero
    
    // whether it is currently being dragged or not
    @State private var isDragging = false
    
    var body: some View {
        let dragGesture = DragGesture().onChanged { value  in
            offset = value.translation
        }.onEnded { value in
            withAnimation {
                offset = .zero
                isDragging = false
            }
        }
        let pressGesture = LongPressGesture().onEnded {_ in
            withAnimation {
                isDragging = true
            }
        }
        let combine = pressGesture.sequenced(before: dragGesture)
        
        Circle()
            .fill(.red)
            .frame(width: 64, height: 64)
            .scaleEffect(isDragging ? 1.5 : 1.0)
            .offset(offset)
            .gesture(combine)
            
            
        
    }
}

#Preview {
    DragGesturesView()
}
