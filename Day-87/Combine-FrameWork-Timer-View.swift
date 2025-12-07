//
//  Combine-FrameWork-Timer-View.swift
//  Flashzilla
//
//  Created by Deepankar Das on 07/12/25.
//

import SwiftUI
import Combine

struct Combine_FrameWork_Timer_View: View {
    let timer = Timer.publish(every: 1, tolerance: 0.5, on: .main, in: .common).autoconnect()
    @State private var counter = 1
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onReceive(timer) { time in
                if counter <= 5 {
                    print("Timer: \(time)")
                }else{
                    timer.upstream.connect().cancel()
                }
                counter += 1
               
            }
    }
}

#Preview {
    Combine_FrameWork_Timer_View()
}
