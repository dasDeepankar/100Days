//
//  ContentView.swift
//  HotProspects
//
//  Created by Deepankar Das on 29/11/25.
//

import SwiftUI

struct ContentView: View {
    @State private var output = ""
    @State private var backgroundColor = Color.black
    var body: some View {
        
        VStack{
            Text(output)
                .task {
                    await fetchOutput()
                }
            Image(.example)
                .interpolation(.none) // it remove blur edges, gives sharper image
                .resizable()
                .scaledToFit()
                .background(backgroundColor)
            Text("change background")
                .contextMenu {
                    Button("red", systemImage: "checkmark.circle.fill", role: .destructive){
                        backgroundColor = .red
                    }
                    Button("blue"){
                        backgroundColor = .blue
                    }
                    Button("black"){
                        backgroundColor = .black
                    }
                }
            
            
            
        }
    }
    
    func fetchOutput() async {
        let fetchTask = Task {
            let url = URL(string: "https://hws.dev/readings.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let readings = try JSONDecoder().decode([Double].self, from: data)
            return "Found \(readings.count) readings"
        }
        let result = await fetchTask.result
        
        switch result {
        case .success(let value):
            output = value
        case .failure(let error):
            output = "Error : \(error.localizedDescription)"
        }
        
    }
}

#Preview {
    ContentView()
}
