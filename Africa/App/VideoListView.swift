//
//  VideoListView.swift
//  Africa
//
//  Created by Ivan Romero on 22/01/2024.
//

import SwiftUI

struct VideoListView: View {
    // MARK: - PROPERTIES
    @State var videos: [Video] = Bundle.main.decode("videos.json")
    let hapticimpact = UIImpactFeedbackGenerator(style: .medium)
    
    // MARK: - FUNCS
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            List(videos) { video in
                NavigationLink(destination: VideoPlayerView(videoSelected: video.id, videoTitle: video.name)) {
                    VideoListItemView(video: video)
                        .padding(.vertical, 8)
                }
            }
            .navigationTitle("Videos")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        self.videos.shuffle()
                        hapticimpact.impactOccurred()
                    } label: {
                        Image(systemName: "arrow.2.squarepath")
                    }
                }
            }
        }
    }
}

// MARK: - PREVIEW
#Preview {
    VideoListView()
}
