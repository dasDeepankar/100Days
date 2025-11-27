//
//  ContentView.swift
//  MeetUp
//
//  Created by Deepankar Das on 27/11/25.
//

import SwiftUI



struct ContentView: View {
    
    @State private var user = User()
    @State private var showSheet: Bool = false
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(user.persons) { person in
                    
                    NavigationLink {
                        DetailView(person: person)
                    } label: {
                        HStack(spacing: 10){
                            Image(uiImage: person.inputImage)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .clipShape(.circle)
                            Text(person.name).font(.default)
                        }
                    }
                    
                }.onDelete(perform: deleteItems)
            }.navigationTitle("MeetUp")
                .sheet(isPresented: $showSheet, content: {
                    AddView(user: user)
                })
                .toolbar {
                    EditButton()
                    Button("add people", systemImage: "plus"){
                        showSheet = true
                    }
                }
        }
    }
    func deleteItems(at offsets: IndexSet) {
        for index in offsets {
            user.deleteData(at: index)
        }
    }
}

#Preview {
    ContentView()
}
