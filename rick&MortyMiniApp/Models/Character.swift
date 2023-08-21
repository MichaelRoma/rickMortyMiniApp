//
//  Character.swift
//  rick&MortyMiniApp
//
//  Created by Mikhayl Romanovsky on 2023/8/18.
//

import Foundation

struct Character: Codable, Hashable{
    var id: Int
    let name: String?
    let status: String?
    let species: String?
    let type: String?
    let gender: String?
    let origin: Origin?
    let location: Location?
    let image: String?
    let episode: [String]?
    
    let url: String?
    let created: String?
    
    struct Origin: Codable {
        let name: String?
        let url: String?
    }
    
    struct Location: Codable {
        let name: String?
        let url: String?
    }
    
    static func == (lhs: Character, rhs: Character) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct CharactersResponse: Codable {
    var info: Info?
    var results: [Character]?
    
    struct Info: Codable {
        let count: Int?
        let pages: Int?
        let next: String?
        let prev: String?
    }
}
