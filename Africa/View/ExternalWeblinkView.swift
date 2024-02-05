//
//  ExternalWeblinkView.swift
//  Africa
//
//  Created by Ivan Romero on 22/01/2024.
//

import SwiftUI

struct ExternalWeblinkView: View {
    // MARK: - PROPERTIES
    let animal: Animal
    
    // MARK: - FUNCS
    // MARK: - BODY
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group {
                    Link(animal.name, destination: (URL(string: animal.link) ?? URL(string: "https://wikipedia.org"))!)
                    Image(systemName: "arrow.up.right.square")
                }
                .foregroundStyle(.accent)
            }
        }
    }
}

// MARK: - PREVIEW
fileprivate let animals: [Animal] = Bundle.main.decode("animals.json")
#Preview(traits: .sizeThatFitsLayout) {
    ExternalWeblinkView(animal: animals[0])
        .padding()
}
