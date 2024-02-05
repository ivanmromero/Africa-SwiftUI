//
//  InsetFactView.swift
//  Africa
//
//  Created by Ivan Romero on 22/01/2024.
//

import SwiftUI

struct InsetFactView: View {
    // MARK: - PROPERTIES
    let animal: Animal
    
    // MARK: - FUNCS
    // MARK: - BODY
    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact , id: \.self) { fact in
                    Text(fact)
                }
            }
            .tabViewStyle(.page)
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        }
    }
}

// MARK: - PREVIEW
fileprivate let animals: [Animal] = Bundle.main.decode("animals.json")

#Preview(traits: .sizeThatFitsLayout) {
    InsetFactView(animal: animals[0])
        .padding()
}
