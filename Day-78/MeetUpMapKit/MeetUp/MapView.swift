//
//  MapView.swift
//  MeetUp
//
//  Created by Deepankar Das on 28/11/25.
//

import CoreLocation
import MapKit
import SwiftUI

struct MapView: View {

    var coordinate: CLLocationCoordinate2D
   @State private var position: MapCameraPosition
    
    var body: some View {
        MapReader { proxy in
            Map(position: $position ){
                Marker("Location", coordinate: coordinate)
            }
            .mapStyle(.hybrid)
            .frame(height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
        self.position = .region(MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)))
    }
}

#Preview {
    let coordinate = CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)
    MapView(coordinate: coordinate)
}
