//
//  NavigationSplitIpadView.swift
//  SnowSeeker
//
//  Created by Deepankar Das on 26/12/25.
//

import SwiftUI

struct NavigationSplitIpadView: View {
    var body: some View {
        NavigationSplitView(columnVisibility: .constant(.all)){
            NavigationLink("Primary"){
                Text("New View")
            }
        } detail: {
            Text("Content")
                .navigationTitle("Content View")
        }.navigationSplitViewStyle(.balanced)
    }
}

#Preview {
    NavigationSplitIpadView()
}
