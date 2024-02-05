//
//  ContentView.swift
//  Africa
//
//  Created by Ivan Romero on 22/01/2024.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    @State private var gridLayout: [GridItem] = Array(repeating: .init(.flexible()), count: 1)
    @State private var gridColumns: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    @State private var isGridViewActive: Bool = false
    
    // MARK: - FUNCS
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumns = gridLayout.count
        
        switch gridColumns {
        case 1:
            toolbarIcon = "square.grid.2x2"
        case 2:
            toolbarIcon = "square.grid.3x2"
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }
    }
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            Group {
                switch isGridViewActive {
                case true:
                    ScrollView(.vertical) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10, content: {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                    AnimalGridItemView(animal: animal)
                                }
                            }
                        })
                        .padding(10)
                        .animation(.easeIn, value: UUID())
                    }
                    .scrollIndicators(.hidden)
                case false:
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        ForEach(animals) { animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                AnimalListItemView(animal: animal)
                            }
                        }
                        
                        CreditsView()
                            .modifier(CenterModifier())
                    }
                }
            }
            .listStyle(.inset)
            .navigationTitle("Africa")
            .navigationBarTitleDisplayMode(.large)
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    HStack(alignment: .center, spacing: 16, content: {
                        Button {
                            isGridViewActive = false
                            haptics.impactOccurred()
                        } label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundStyle(isGridViewActive ? .white : .accent)
                        }
                        
                        Button {
                            isGridViewActive = true
                            haptics.impactOccurred()
                            gridSwitch()
                        } label: {
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundStyle(isGridViewActive ? .accent : .white)
                        }
                    })
                }
            })
        }
    }
}

// MARK: - PREVIEW
#Preview {
    ContentView()
}
