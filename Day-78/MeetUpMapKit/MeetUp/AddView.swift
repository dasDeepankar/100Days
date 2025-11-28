//
//  AddView.swift
//  MeetUp
//
//  Created by Deepankar Das on 27/11/25.
//

import MapKit
import PhotosUI
import SwiftUI

struct AddView: View {
    
    let locationFetcher = LocationFetcher()
    
    @Environment(\.dismiss) var dismiss
    
    var user : User
    
    @State private var pickerItem : PhotosPickerItem?
    @State private var selectedImage : Image?
    @State private var name = ""
    @State private var selectedImageData : Data?
    @State private var latitude: Double = 1.0
    @State private var longitude: Double = 1.0
    var coordinate : CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    
    var body: some View {
        NavigationStack{
            VStack{
                PhotosPicker(selection: $pickerItem, matching: .images){
                    if let selectedImage = selectedImage {
                        selectedImage
                            .resizable()
                            .scaledToFill()
                            .frame(width: 300, height: 300)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .shadow(radius: 8)
                    }else{
                        VStack{
                            Image(systemName: "photo").resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                            Text("Pick a photo")
                        }
                        .frame(width: 300, height: 300)
                        .background(.black.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .shadow(radius: 8)
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
                        fetchLocation()
                    }
                }
                
                
                Spacer()
                if (selectedImage != nil) {
                    Form{
                        Section{
                            TextField("Person Name", text: $name)
                            MapView(coordinate: coordinate)
                            
                        }
                    }
                }
                
                
            }.navigationTitle("Add People")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    Button("Save"){
                        if let selectedImageData {
                            let newPerson = Person(name: name, personImage: selectedImageData, latitude: latitude, longitude: longitude)
                            user.saveData(newPerson: newPerson)
                        }
                        dismiss()
                    }
                }
                .onAppear{
                    locationFetcher.start()
                }
        }
    }
    
    func fetchLocation() {
        if let location = locationFetcher.lastKnownLocation {
            latitude = location.latitude
            longitude = location.longitude
            print("Your location is \(location)")
        } else {
            print("Your location is unknown")
        }
    }
}

#Preview {
    let user = User()
    NavigationStack{
        AddView(user: user)
    }
    
}
