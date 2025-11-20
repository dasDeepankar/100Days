//
//  ContentView.swift
//  BucketList
//
//  Created by Deepankar Das on 12/11/25.
//

import MapKit
import SwiftUI

struct ContentView: View {
    
    @State private var locations = [Location]()
    @State private var selectedLocation : Location?
    private let startingPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center:CLLocationCoordinate2D(latitude: 17.4, longitude: 78.4),
            span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
        )
    )
    
    var body: some View {
        MapReader { proxy in
            Map(initialPosition: startingPosition){
                ForEach(locations){ location in
                    Annotation(location.name, coordinate: location.coordinate) {
                        Button {
                            selectedLocation = location
                        } label: {
                            Image(systemName: "pin.circle")
                                .resizable()
                                .foregroundStyle(.red)
                                .frame(width: 44, height: 44)
                                .background(.white)
                                .clipShape(.circle)
                        }
                        
                    }
                }
            }
            .mapStyle(.hybrid)
            .onTapGesture { position in
                if let coordinate = proxy.convert(position, from: .local){
                    let newLocation = Location(id: UUID(), name: "New Location", description: "", latitude: coordinate.latitude, longitude: coordinate.longitude)
                    locations.append(newLocation)
                }
            }.sheet(item: $selectedLocation) { place in
                EditView(location: place) { newLocation in
                    if let selectedIndex = locations.firstIndex(of: place){
                        locations[selectedIndex] = newLocation
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
