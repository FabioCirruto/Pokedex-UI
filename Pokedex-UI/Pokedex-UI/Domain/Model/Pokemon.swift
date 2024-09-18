//
//  Pokemon.swift
//  Pokedex-UI
//
//  Created by Fabio Cirruto on 18/09/24.
//

import Foundation

class Pokemon {
    let name: String
    let image: String
    let types: [Types]
    let desc: String
    
    init(name: String, image: String, types: [Types], desc: String) {
        self.name = name
        self.image = image
        self.types = types
        self.desc = desc
    }
    
    init(info: PokemonDto, desc: PokemonDescDto) {
        self.name = info.name ?? ""
        self.image = info.sprites?.frontDefault ?? ""
        self.types = (info.types ?? [])
            .compactMap { $0.type }
            .compactMap { $0.name }
            .map {
                Types(name: $0.capitalized)
            }
        self.desc = (desc.flavorTextEntries?.first?.flavorText ?? "").replacingOccurrences(of: "\n", with: "")
    }
}

class Types: Identifiable {    
    let id: UUID = UUID()
    let name: String
    
    init(name: String) {
        self.name = name
    }
}
