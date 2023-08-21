//
//  Episode.swift
//  rick&MortyMiniApp
//
//  Created by Mikhayl Romanovsky on 2023/8/21.
//

import Foundation
 
struct Episode: Codable, Identifiable {
    let id: Int?
    let name: String?
    let air_date: String?
    let episode: String?
}
