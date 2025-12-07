//
//  BackGroundDetectView.swift
//  Flashzilla
//
//  Created by Deepankar Das on 07/12/25.
//

import SwiftUI

struct BackGroundDetectView: View {
    @Environment(\.scenePhase) var scenePhase
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onChange(of: scenePhase) { oldValue, newValue in
                if newValue == .active {
                    print("Screen is Active \(scenePhase)")
                }
                else if  newValue == .inactive{
                    print("Screen is inactive \(scenePhase)")
                }
                else if  newValue == .background{
                    print("Screen is background \(scenePhase)")
                }
            }
    }
}

#Preview {
    BackGroundDetectView()
}
