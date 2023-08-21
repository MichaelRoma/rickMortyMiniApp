//
//  ImageLoader.swift
//  rick&MortyMiniApp
//
//  Created by Mikhayl Romanovsky on 2023/8/18.
//

import Foundation
import UIKit

final class ImageLoader {
    static let shared = ImageLoader()
    private init() {}
    
    private let imageCache = NSCache<NSString, UIImage>()
    func loadImage(from urlString: String, completion: @escaping (Result<UIImage, NetworkError>) -> Void) {
        guard let cacheImage = imageCache.object(forKey: urlString as NSString) else {
            guard let url = URL(string: urlString) else {
                print(urlString)
                completion(.failure(.urlCreatingError))
                return }
            
            URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
                if error != nil { completion(.failure(.requestFaild))}
                if let data = data, let image = UIImage(data: data) {
                    self?.imageCache.setObject(image, forKey: urlString as NSString)
                    completion(.success(image))
                } else { completion(.failure(.imageCreatingError)) }
            }.resume()
            return }
        completion(.success(cacheImage))
    }
}
