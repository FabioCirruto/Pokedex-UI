//
//  PokemonInfo.swift
//  Pokedex-UI
//
//  Created by Fabio Cirruto on 16/09/24.
//

import Foundation

struct PokemonInfo: Hashable {
    var name: String
    var detail: String
    
    init(name: String, image: String) {
        self.name = name
        self.detail = image
    }
    
    init(from: PokemonInfoDto) {
        self.name = from.name ?? ""
        self.detail = from.url ?? ""
    }
}
