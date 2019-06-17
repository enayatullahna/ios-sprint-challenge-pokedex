//
//  Pokemon.swift
//  SpintChallenge3
//
//  Created by Enayatullah Naseri on 6/14/19.
//  Copyright © 2019 Enayatullah Naseri. All rights reserved.
//

import Foundation

struct Pokemon: Equatable, Codable {
    static func == (lhs: Pokemon, rhs: Pokemon) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name
    }
    
    let name: String
    let id: Int
    let abilities: [Ability]
    let types: [Type]
    let sprites: Sprite
    
}

struct Ability: Codable {
    let ability: Species
}

struct Type: Codable {
    let type: Species
}

struct Species: Codable {
    let name: String
}

struct PokemonSearch: Codable {
    
    let results: [Pokemon]
}

struct Sprite: Codable {
    let frontDefault: String
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

