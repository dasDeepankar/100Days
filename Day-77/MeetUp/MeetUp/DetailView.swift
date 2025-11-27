//
//  DetailView.swift
//  MeetUp
//
//  Created by Deepankar Das on 28/11/25.
//

import SwiftUI

struct DetailView: View {
    var person : Person
    var body: some View {
        VStack{
            Image(uiImage: person.inputImage)
                .resizable()
                .scaledToFill()
                .frame(width: .infinity, height: 300)
            
            Spacer()
            Form{
                Section{
                    Text(person.name)
                }
                Section{
                    Text(person.description)
                }
            }
            
        }.navigationTitle("Detail View")
            .navigationBarTitleDisplayMode(.inline)
        
    }
}
#Preview {
    DetailView(person: Person(name: "Text", description: "Description", personImage: Data()))
}
