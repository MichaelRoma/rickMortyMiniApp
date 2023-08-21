//
//  CharacterDetailView.swift
//  rick&MortyMiniApp
//
//  Created by Mikhayl Romanovsky on 2023/8/19.
//

import SwiftUI

struct CharacterDetailView: View {
    @ObservedObject var viewModel: CharacterDetailViewModel
    
    init(character: Character) {
        self.viewModel = CharacterDetailViewModel(character: character)
    }
    
    var body: some View {
        ScrollView {
            VStack {
            AsyncImage(image: viewModel.image,
                       name: viewModel.character.name,
                       status: viewModel.character.status)
            InfoBlock(species: viewModel.character.species ?? "",
                      type: viewModel.character.type ?? "",
                      gender: viewModel.character.gender ?? "")
            OriginBlock(origin: viewModel.origin)
            EpisodsView(episodes: viewModel.episodes)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            viewModel.loadImage()
            viewModel.loadOrigin()
            viewModel.loadEpisodes()
        }}.background(Color("BlackBG"))

    }
}
