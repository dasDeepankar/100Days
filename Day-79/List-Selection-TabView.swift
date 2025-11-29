//
//  ContentView.swift
//  HotProspects
//
//  Created by Deepankar Das on 29/11/25.
//

import SwiftUI

struct ContentView: View {
    let users = ["Tohru", "Yuki", "Kyo", "Momiji"]
    @State private var selection = Set<String>()
    @State private var selectedTab = "home"
    
    var body: some View {
        
        TabView(selection: $selectedTab){
            Tab("Home", systemImage: "house", value: "home") {
                NavigationStack{
                    VStack{
                        Text(selection.formatted()).padding()
                        List(users, id: \.self, selection: $selection) { user in
                            Text(user)
                        }
                    }  .navigationBarTitle("Hot Prospects")
                        .toolbar {
                            EditButton()
                        }
                }
            }
            Tab("Favorites", systemImage: "star", value: "star") {
                Button("Home", systemImage: "house") {
                    selectedTab = "home"
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
