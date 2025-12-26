//
//  SearchableView.swift
//  SnowSeeker
//
//  Created by Deepankar Das on 26/12/25.
//

import SwiftUI

struct SearchableView: View {
    @State private var searchText = ""
    let allNames = ["Subh", "Vina", "Melvin", "Steve"]
    var filterNames : [String] {
        if (searchText.isEmpty){
            allNames
        }else{
            allNames.filter({$0.localizedStandardContains(searchText)})
        }
    }
    var body: some View {
        NavigationStack{
//            Text("Searching for \(searchText)")
//                .searchable(text: $searchText, prompt: "Look for something")
//                .navigationBarTitle("Searching")
            
            List(filterNames, id: \.self) {name in
                Text(name)
            }.searchable(text: $searchText, prompt: "Look for something")
            .navigationTitle("Searching")
        }
    }
}

#Preview {
    SearchableView()
}
