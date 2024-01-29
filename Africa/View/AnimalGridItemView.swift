//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by Ivan Romero on 29/01/2024.
//

import SwiftUI

struct AnimalGridItemView: View {
    // MARK: - PROPERTIES
    let animal: Animal

    
    // MARK: - FUNCS
    // MARK: - BODY
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .clipShape(.rect(cornerRadius: 12))
    }
}

// MARK: - PREVIEW
fileprivate let animals: [Animal] = Bundle.main.decode("animals.json")
#Preview(traits: .sizeThatFitsLayout) {
    AnimalGridItemView(animal: animals[0])
        .padding()
}
