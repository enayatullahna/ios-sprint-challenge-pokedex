//
//  Pokemon.swift
//  SpintChallenge3
//
//  Created by Enayatullah Naseri on 6/14/19.
//  Copyright © 2019 Enayatullah Naseri. All rights reserved.
//

import Foundation

struct Pokemon: Codable, Equatable {
    
    static func == (lhs: Pokemon, rhs: Pokemon) -> Bool {
        return lhs.id == rhs.id &&
            lhs.name == rhs.name
    }
    
    var id: Int
    var name: String
    var abilities: [Abilities]
    var types: [PokeType]
    var sprites: Sprites
    
    
    
}

struct Abilities: Codable {
    var ability: Description
}

struct PokeType: Codable {
    let slot: Int
    let type: Description
}

struct Description: Codable {
    let name: String
}


struct Sprites: Codable {
    var frontDefault: String
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}
