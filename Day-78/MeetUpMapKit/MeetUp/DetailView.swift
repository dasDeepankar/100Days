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
        Form{
            Section{
                Text(person.name)
                Text(person.date)
                Image(uiImage: person.inputImage)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .frame(width: 350, height: 350)
                MapView(coordinate: person.coordinate)
                
            }
            
        }.navigationTitle("Detail View")
        
    }
}
#Preview {
    DetailView(person: Person(name: "Text",personImage: Data(), latitude: 1.0, longitude: 1.0))
}
