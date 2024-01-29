//
//  GalleryView.swift
//  Africa
//
//  Created by Ivan Romero on 22/01/2024.
//

import SwiftUI

struct GalleryView: View {
    // MARK: - PROPERTIES
    
    // MARK: - FUNCS
    // MARK: - BODY
    var body: some View {
        ScrollView(.vertical) {
           
        }
        .scrollIndicators(.hidden)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            MotionAnimationView()
        }
    }
}

// MARK: - PREVIEW
#Preview {
    GalleryView()
}
