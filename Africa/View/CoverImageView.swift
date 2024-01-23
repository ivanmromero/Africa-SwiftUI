//
//  CoverImageView.swift
//  Africa
//
//  Created by Ivan Romero on 22/01/2024.
//

import SwiftUI

struct CoverImageView: View {
    // MARK: - PROPERTIES
    let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
    
    // MARK: - FUNCS
    
    // MARK: - BODY
    var body: some View {
        TabView {
            ForEach(coverImages) { image in
                Image(image.name)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(.page)
        

    }
}

// MARK: - PROPERTIES
#Preview(traits: .fixedLayout(width: 400, height: 300)) {
    CoverImageView()
}
