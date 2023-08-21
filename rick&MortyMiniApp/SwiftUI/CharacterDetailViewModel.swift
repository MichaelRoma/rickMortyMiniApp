//
//  CharacterDetailViewModel.swift
//  rick&MortyMiniApp
//
//  Created by Mikhayl Romanovsky on 2023/8/19.
//

import SwiftUI

class CharacterDetailViewModel: ObservableObject {
    @Published var image: Image?
    @Published var origin: Origin?
    @Published var episodes: [Episode]?
    
    let character: Character
    
    init(character: Character) {
        self.character = character
    }
    
    func loadImage() {
        ImageLoader.shared.loadImage(from: character.image ?? "") { result in
            switch result {
            case .success(let success):
                DispatchQueue.main.async { [weak self] in
                    self?.image = Image(uiImage: success)
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func loadOrigin() {
        NetworkManager.shared.fetchDataG(from: character.origin?.url ?? "") { (result: Result<Origin, NetworkError>) in
            switch result {
            case .success(let success):
                DispatchQueue.main.async { [weak self] in
                    self?.origin = success
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func loadEpisodes() {
        NetworkManager.shared.fetchEpisodes(from: character.episode ?? [String]()) { [weak self] result in
            switch result {
            case .success(let success):
                self?.episodes = success
            case .failure(let failure):
                print(failure)
            }
        }
    }
}

