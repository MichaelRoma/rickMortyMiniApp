//
//  EpisodeCellView.swift
//  rick&MortyMiniApp
//
//  Created by Mikhayl Romanovsky on 2023/8/21.
//

import SwiftUI

struct EpisodeCellView: View {
    var episode: Episode
    
    var body: some View {
        VStack {
            HStack{
                Text(episode.name ?? "")
                    .font(.system(size: 17, weight: .medium))
                    .foregroundColor(Color.white)
                Spacer()
            }.padding()
            Spacer()
            HStack {
                Text(formatEpisodeString(from:episode.episode) ?? "")
                    .font(.system(size: 13, weight: .medium))
                    .foregroundColor(Color("PrimeGreen"))
                Spacer()
                Text(episode.air_date ?? "")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(Color("GrayText"))
                
            } .padding()
        }
        .background(Color("CellBackGround"))
        .cornerRadius(10)
        
    }
    
    private func formatEpisodeString(from rawString: String?) -> String? {
        if let rawString = rawString, rawString.count == 6, let seasonNumber = Int(rawString.prefix(3).suffix(2)),
           let episodeNumber = Int(rawString.suffix(2)) {
            return "Episode: \(episodeNumber), Season: \(seasonNumber)"
        } else { return nil }
    }
}
