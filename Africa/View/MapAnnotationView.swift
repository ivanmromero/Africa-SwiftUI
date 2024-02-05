//
//  MapAnnotationView.swift
//  Africa
//
//  Created by Ivan Romero on 26/01/2024.
//

import SwiftUI

struct MapAnnotationView: View {
    // MARK: - PROPERTIES
    var location: NationalParkLocation
    @State private var animation: Double = 0.0
    
    // MARK: - FUNCS
    // MARK: - BODY
    var body: some View {
        ZStack {
            Circle()
                .fill(.accent)
                .frame(width: 54, height: 54, alignment: .center)
            
            Circle()
                .stroke(.accent, lineWidth: 2)
                .frame(width: 52, height: 52, alignment: .center)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)
            
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
            .clipShape(Circle())
        }
        .onAppear(perform: {
            withAnimation(.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                animation = 1
            }
        })
    }
}

// MARK: - PREVIEW
fileprivate let locations: [NationalParkLocation] =  Bundle.main.decode("locations.json")
#Preview(traits: .sizeThatFitsLayout) {
    MapAnnotationView(location: locations[0])
        .padding()
}
