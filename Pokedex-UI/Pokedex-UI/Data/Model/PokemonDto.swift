//
//  PokemonDto.swift
//  Pokedex-UI
//
//  Created by Fabio Cirruto on 18/09/24.
//

import Foundation

class PokemonDto: Codable {
    init(name: String? = nil, sprites: ImagesDto? = nil, types: [TypeDto]? = nil, species: SpeciesInfoDto? = nil) {
        self.name = name
        self.sprites = sprites
        self.types = types
        self.species = species
    }
    
    var name: String?
    var sprites: ImagesDto?
    var types: [TypeDto]?
    var species: SpeciesInfoDto?
}

class ImagesDto: Codable {
    init(frontDefault: String? = nil) {
        self.frontDefault = frontDefault
    }
    
    var frontDefault: String?
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

class SpeciesInfoDto: Codable {
    init(name: String? = nil, url: String? = nil) {
        self.name = name
        self.url = url
    }
    
    var name: String?
    var url: String?
}

struct TypeDto: Codable {
    let slot: Int
    let type: PokemonTypeDto
}

struct PokemonTypeDto: Codable {
    let name: String
    let url: String
}
