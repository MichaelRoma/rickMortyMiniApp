//
//  EpisodsView.swift
//  rick&MortyMiniApp
//
//  Created by Mikhayl Romanovsky on 2023/8/21.
//

import SwiftUI

struct EpisodsView: View {
    var episodes: [Episode]?
    
    init(episodes: [Episode]?) {
        self.episodes = episodes
    }
    
    var body: some View {
        LazyVStack(alignment: .leading, spacing: 20) {
            Text("Episodes")
                .font(.system(size: 17, weight: .bold))
               .foregroundColor(.white)
            ForEach(episodes ?? []) { episode in
                EpisodeCellView(episode: episode)
            }
        }.padding()
    }
}
