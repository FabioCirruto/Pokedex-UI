//
//  PokemonDescDto.swift
//  Pokedex-UI
//
//  Created by Fabio Cirruto on 18/09/24.
//

import Foundation

class PokemonDescDto: Codable {
    var flavorTextEntries: [FlavorTextEntriesDto]?
    
    enum CodingKeys: String, CodingKey {
        case flavorTextEntries = "flavor_text_entries"
    }
}

class FlavorTextEntriesDto: Codable {
    var flavorText: String
    
    enum CodingKeys: String, CodingKey {
        case flavorText = "flavor_text"
    }
}
