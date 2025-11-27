//
//  AddView.swift
//  MeetUp
//
//  Created by Deepankar Das on 27/11/25.
//

import PhotosUI
import SwiftUI

struct AddView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var user : User
    
    @State private var pickerItem : PhotosPickerItem?
    @State private var selectedImage : Image?
    @State private var name = ""
    @State private var description = ""
    @State private var selectedImageData : Data?
    
    
    var body: some View {
        NavigationStack{
            VStack{
                PhotosPicker(selection: $pickerItem, matching: .images){
                    if let selectedImage = selectedImage {
                        selectedImage
                            .resizable()
                            .scaledToFill()
                            .frame(width: 300, height: 300)
                            .clipShape(.circle)
                            .shadow(radius: 10)
                    }else{
                        VStack{
                            Image(systemName: "photo").resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                            Text("Pick a photo")
                        }
                        .frame(width: 300, height: 300)
                        .background(.black.opacity(0.1))
                        .clipShape(.circle)
                        .shadow(radius: 10)
                        .foregroundStyle(.secondary)
                    }
                    
                }
                .buttonStyle(.plain)
                .padding()
                .onChange(of: pickerItem) {
                    Task {
                        guard let imageData = try await pickerItem?.loadTransferable(type: Data.self) else { return }
                        guard let inputImage = UIImage(data: imageData) else { return }
                        selectedImage = Image(uiImage: inputImage)
                        self.selectedImageData = imageData
                    }
                }
                Spacer()
                
                if (selectedImage != nil) {
                    Form{
                        Section{
                            TextField("Person Name", text: $name)
                        }
                        Section{
                            TextField("Description", text: $description)
                        }
                    }
                }
                
            }.navigationTitle("Add People")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    Button("Save"){
                        if let selectedImageData {
                            let newPerson = Person(name: name, description: description, personImage: selectedImageData)
                            user.saveData(newPerson: newPerson)
                            
                            
                        }
                        dismiss()
                    }
                }
        }
    }
}

#Preview {
    let user = User()
    AddView(user: user)
}
