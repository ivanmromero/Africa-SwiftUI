//
//  CenterModifier.swift
//  Africa
//
//  Created by Ivan Romero on 29/01/2024.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
