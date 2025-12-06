//
//  GesturesView.swift
//  Flashzilla
//
//  Created by Deepankar Das on 06/12/25.
//

import SwiftUI

struct GesturesView: View {
    //    @State private var currentAmount = 0.0
    //    @State private var finalAmount = 1.0
    @State private var currentAmount = Angle.zero
    @State private var finalAmount = Angle.zero
    var body: some View {
        //        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        //            .onLongPressGesture {
        //                print( "Long Pressed" )
        //            } onPressingChanged: { inProgress in
        //                print("inProgress", inProgress)
        //            }
        //        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        //            .scaleEffect(currentAmount + finalAmount)
        //            .gesture(
        //                MagnifyGesture()
        //                    .onChanged { value in
        //                    currentAmount = value.magnification - 1
        //                    }.onEnded({ value in
        //                        finalAmount += currentAmount
        //                        currentAmount = 0
        //                    })
        //            )
        
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            .rotationEffect(currentAmount + finalAmount)
//            .gesture(
//                RotateGesture()
//                    .onChanged({ value in
//                        currentAmount = value.rotation
//                    }).onEnded({ _ in
//                        finalAmount += currentAmount
//                        currentAmount = Angle.zero
//                    })
//            )
        VStack {
            Text("Hello, World!")
                .onTapGesture {
                    print("Text tapped")
                }
        }
//        .highPriorityGesture(
//            TapGesture().onEnded {
//                print("High priority tap gesture ended")
//            }
//        )
        .simultaneousGesture(
            TapGesture().onEnded {
                print("simultaneous tap gesture ended")
            }
        )
    }
    
}

#Preview {
    GesturesView()
}
