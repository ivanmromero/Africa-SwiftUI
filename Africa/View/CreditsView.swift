//
//  CreditsView.swift
//  Africa
//
//  Created by Ivan Romero on 29/01/2024.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128, alignment: .center)
            
            Text("""
    Copyright ® Ivan Manuel Romero
    All right reserved
    Better Apps ♡ Less Code
    """)
            .font(.footnote)
        .multilineTextAlignment(.center)
        }
        .padding()
        .opacity(0.4)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CreditsView()
        .padding()
}
