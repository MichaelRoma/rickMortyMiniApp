//
//  NetworkManager.swift
//  rick&MortyMiniApp
//
//  Created by Mikhayl Romanovsky on 2023/8/18.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    func fetchDataG<T: Codable>(from endpoint: String, completion: @escaping (Result<T, NetworkError>) -> Void) {
        guard let url = URL(string: endpoint) else {
            completion(.failure(.urlCreatingError))
            return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if error != nil {
                completion(.failure(.requestFaild))
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let networkResponce = try JSONDecoder().decode(T.self, from: data)
                completion(.success(networkResponce))
            } catch {
                completion(.failure(.jsonDecodingError))
            }
        }.resume()
    }
    
    func fetchEpisodes(from endpoints: [String], completion: @escaping (Result<[Episode], NetworkError>) -> Void) {
        let group = DispatchGroup()
        var result: [Episode] = []
        endpoints.forEach {
            group.enter()
            guard let url = URL(string: $0) else {
                group.leave()
                return
            }
            
            URLSession.shared.dataTask(with: url) { data, _, error in
                if error != nil {
                    group.leave()
                    completion(.failure(.requestFaild))
                }
                
                guard let data = data else {
                    completion(.failure(.noData))
                    group.leave()
                    return
                }
                do {
                    let networkResponce = try JSONDecoder().decode(Episode.self, from: data)
                    result.append(networkResponce)
                    group.leave()
                } catch {
                    completion(.failure(.jsonDecodingError))
                }
            }.resume()
            group.notify(queue: .main) {
                completion(.success(result))
            }
        }
    }
}
