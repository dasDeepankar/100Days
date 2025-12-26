//
//  AlertAndSheetWithOptionalView.swift
//  SnowSeeker
//
//  Created by Deepankar Das on 26/12/25.
//

import SwiftUI

struct User : Identifiable {
    var id = "Taylor Swift"
}

struct AlertAndSheetWithOptionalView: View {
    
    @State private var selectedUser : User? = nil
    @State private var isShowingUser = false
    
    var body: some View {
        Button("Tap Me"){
            selectedUser = User()
            isShowingUser = true
        }
//        .alert("Welcome", isPresented: $isShowingUser, presenting: selectedUser) { user in
//            Button(user.id){}
//        }
        .sheet(item: $selectedUser) { user in
            Text("user: \(user.id)")
                .presentationDetents([.medium, .large])
        }
    }
}

#Preview {
    AlertAndSheetWithOptionalView()
}
