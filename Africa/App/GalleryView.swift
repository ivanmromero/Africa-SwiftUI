//
//  GalleryView.swift
//  Africa
//
//  Created by Ivan Romero on 22/01/2024.
//

import SwiftUI

struct GalleryView: View {
    // MARK: - PROPERTIES
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    @State private var selectedAnimal: String = "lion"
    @State private var gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    @State private var gridColumns: Double = 3.0
    
    // MARK: - FUNCS
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumns))
    }
    
    // MARK: - BODY
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .center, spacing: 30) {
                // MARK: - IMAGE
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .stroke(.white, lineWidth: 8)
                    }
                
                // MARK: - SLIDER
                Slider(value: $gridColumns, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumns) {
                        gridSwitch()
                    }
                
                // MARK: - GRID
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10, content: {
                    ForEach(animals) { animal in
                        Image(animal.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay {
                                Circle()
                                    .stroke(.white, lineWidth: 1)
                            }
                            .onTapGesture {
                                selectedAnimal = animal.image
                                haptics.impactOccurred()
                            }
                    }
                })
                .animation(.easeIn, value: UUID())
                .onAppear {
                    gridSwitch()
                }
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
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
