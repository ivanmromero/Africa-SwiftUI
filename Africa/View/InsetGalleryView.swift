//
//  InsetGalleryView.swift
//  Africa
//
//  Created by Ivan Romero on 22/01/2024.
//

import SwiftUI

struct InsetGalleryView: View {
    // MARK: - PROPERTIES
    let animal: Animal
    
    // MARK: - FUNCS
    // MARK: - BODY
    var body: some View {
        ScrollView(.horizontal) {
            HStack(alignment: .center, spacing: 15) {
                ForEach(animal.gallery, id: \.self) { image in
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .clipShape(.rect(cornerRadius: 12))
                }
            }
        }
        .scrollIndicators(.hidden)
    }
}

fileprivate let animals: [Animal] = Bundle.main.decode("animals.json")

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    InsetGalleryView(animal: animals[0])
        .padding()
}
