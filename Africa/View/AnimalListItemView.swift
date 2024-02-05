//
//  AnimalListItemView.swift
//  Africa
//
//  Created by Ivan Romero on 22/01/2024.
//

import SwiftUI

struct AnimalListItemView: View {
    // MARK: - PROPERTIES
    let animal: Animal
    
    // MARK: - FUNCS
    // MARK: - BODY
    var body: some View {
        HStack(alignment: .center, spacing: 16, content: {
            Image(animal.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            VStack(alignment: .leading, spacing: 8, content: {
                Text(animal.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundStyle(.accent)
                
                Text(animal.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.trailing, 8)
            })
        })
    }
}

// MARK: - PREVIEW
fileprivate let animals: [Animal] = Bundle.main.decode("animals.json")

#Preview(traits: .sizeThatFitsLayout) {
    AnimalListItemView(animal: animals[1])
        .padding()
}
