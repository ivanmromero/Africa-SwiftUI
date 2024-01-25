//
//  VideoListItemView.swift
//  Africa
//
//  Created by Ivan Romero on 24/01/2024.
//

import SwiftUI

struct VideoListItemView: View {
    // MARK: - PROPERTIES
    let video: Video
    
    // MARK: - FUNCS
    // MARK: - BODY
    var body: some View {
        HStack(alignment: .center, spacing: 10, content: {
            ZStack {
                Image(video.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                .clipShape(.rect(cornerRadius: 9))
                
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                    .shadow(radius: 4)
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text(video.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundStyle(.accent)
                
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }
        })
    }
}

// MARK: - PREVIEW
fileprivate let videos: [Video] = Bundle.main.decode("videos.json")
#Preview(traits: .sizeThatFitsLayout) {
    VideoListItemView(video: videos[0])
        .padding()
}
