//
//  InsetMapView.swift
//  Africa
//
//  Created by Ivan Romero on 22/01/2024.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
    // MARK: - PROPERTIES
    @State private var region = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599), span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0)))

    // MARK: - FUNCS
    // MARK: - BODY
    var body: some View {
        Map(position: $region)
            .frame(height: 256)
            .clipShape(.rect(cornerRadius: 12))
        
            .overlay(alignment: .topTrailing) {
                NavigationLink(destination: MapView()) {
                    HStack() {
                        Image(systemName: "mappin.circle")
                            .foregroundStyle(.white)
                            .imageScale(.large)
                        
                        Text("Locations")
                            .foregroundStyle(.accent)
                            .fontWeight(.bold)
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 14)
                    .background(Color.black.opacity(0.4).clipShape(.rect(cornerRadius: 8)))
                }
                .padding(12)
            }
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    InsetMapView()
        .padding()
}
