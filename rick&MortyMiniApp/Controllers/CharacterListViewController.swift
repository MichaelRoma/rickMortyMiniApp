//
//  CharacterListViewController.swift
//  rick&MortyMiniApp
//
//  Created by Mikhayl Romanovsky on 2023/8/18.
//

import UIKit
import SwiftUI

final class CharacterListViewController: ColectionViewViewController {
    private var isLoadingMoreCharacters = false
    private var startingUrl = "https://rickandmortyapi.com/api/character"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchData(from: startingUrl) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let succses):
                    self?.model = succses
                case .failure(let error):
                    print(error)
                }
                self?.stopWaitingIndicatore()
            }
        }
    }
    
    private func setupView() {
        view.backgroundColor = UIColor(named: "BlackBG")
        navigationController?.navigationBar.tintColor = .white
        startWaitingIndicator()
    }
    
    private func fetchData(from url: String, completion: @escaping (Result<CharactersResponse, NetworkError>) -> Void) {
        NetworkManager.shared.fetchDataG(from: url, completion: completion)
    }
    
    private func loadMoreCharacters() {
        guard !isLoadingMoreCharacters, let nextLoadUrl = model?.info?.next else { return }
        isLoadingMoreCharacters = true
        fetchData(from: nextLoadUrl) { result in
            switch result {
            case .success(let succses):
                DispatchQueue.main.async { [weak self] in
                    self?.model?.results?.append(contentsOf: succses.results ?? [Character]())
                    self?.model?.info = succses.info
                    self?.isLoadingMoreCharacters = false
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.item == (model?.results?.count ?? 0) - 1 {
            loadMoreCharacters()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        guard let character = model?.results?[indexPath.item] else  { return }
        let characterview = CharacterDetailView(character: character)
        let hostingController = UIHostingController(rootView: characterview)
        navigationController?.pushViewController(hostingController, animated: true)
    }
}
