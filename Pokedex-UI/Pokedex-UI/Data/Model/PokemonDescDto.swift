//
//  PokemonDescDto.swift
//  Pokedex-UI
//
//  Created by Fabio Cirruto on 18/09/24.
//

import Foundation

class PokemonDescDto: Codable {
    init(flavorTextEntries: [FlavorTextEntriesDto]? = nil) {
        self.flavorTextEntries = flavorTextEntries
    }
    
    var flavorTextEntries: [FlavorTextEntriesDto]?
    
    enum CodingKeys: String, CodingKey {
        case flavorTextEntries = "flavor_text_entries"
    }
}

class FlavorTextEntriesDto: Codable {
    init(flavorText: String? = nil) {
        self.flavorText = flavorText
    }
    
    var flavorText: String?
    
    enum CodingKeys: String, CodingKey {
        case flavorText = "flavor_text"
    }
}
