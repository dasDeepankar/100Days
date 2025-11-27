//
//  ContentView.swift
//  MeetUp
//
//  Created by Deepankar Das on 27/11/25.
//
import SwiftData
import SwiftUI



struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    @State private var showSheet: Bool = false
    
    @Query(sort: \User.name) var users : [User]
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(users) { user in
                    NavigationLink {
                        DetailView(person: user)
                    } label: {
                        HStack(spacing: 10){
                            Image(uiImage: user.inputImage)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .clipShape(.circle)
                            Text(user.name).font(.default)
                        }
                    }
                    
                }.onDelete(perform: deleteItems)
            }.navigationTitle("MeetUp")
                .sheet(isPresented: $showSheet, content: {
                    AddView()
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
            let userToDelete = users[index]
            modelContext.delete(userToDelete)
        }
    }
}

#Preview {
    ContentView()
}
