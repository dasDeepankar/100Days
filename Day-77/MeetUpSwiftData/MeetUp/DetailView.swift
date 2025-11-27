//
//  DetailView.swift
//  MeetUp
//
//  Created by Deepankar Das on 28/11/25.
//

import SwiftUI
import SwiftData

struct DetailView: View {
    var person : User
    var body: some View {
        VStack{
            Image(uiImage: person.inputImage)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            Spacer()
            Form{
                Section{
                    Text(person.name)
                }
                Section{
                    Text(person.bio)
                }
            }
            
        }.navigationTitle("Detail View")
            .navigationBarTitleDisplayMode(.inline)
        
    }
}
#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: User.self, configurations: config)
    let sampleUser = User(name: "Sample User", bio: "Sample Description", photo: Data())
    
    return DetailView(person: sampleUser)
        .modelContainer(container)
}
