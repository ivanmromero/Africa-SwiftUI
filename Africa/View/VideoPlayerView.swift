//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Ivan Romero on 25/01/2024.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    // MARK: - PROPERTIES
    var videoSelected: String
    var videoTitle: String
    
    // MARK: - FUNCS
    // MARK: - BODY
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(fileName: videoSelected, fileFormat: "mp4")) {
                Text(videoTitle)
            }
            .overlay(alignment: .top, content: {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .padding(.top, 6)
                    .padding(.horizontal, 8)
            })
        }
        .tint(.accent)
        .navigationTitle(videoTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - PREVIEW
#Preview {
    NavigationStack {
        VideoPlayerView(videoSelected: "lion", videoTitle:"lion")
    }
}
