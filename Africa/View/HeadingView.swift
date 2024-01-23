//
//  HeadingView.swift
//  Africa
//
//  Created by Ivan Romero on 22/01/2024.
//

import SwiftUI

struct HeadingView: View {
    // MARK: - PROPERTIES
    let headingImage: String
    let headingText: String
    
    // MARK: - FUNCS
    // MARK: - BODY
    var body: some View {
        HStack() {
            Image(systemName: headingImage)
                .foregroundStyle(.accent)
                .imageScale(.large)
            
            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
        }
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Picture")
        .padding()
}
