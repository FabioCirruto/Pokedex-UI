//
//  ListPokemon.swift
//  Pokedex-UI
//
//  Created by Fabio Cirruto on 16/09/24.
//

import Foundation

struct ListPokemon {
    var next: String?
    var results: [PokemonInfo]
    
    init(next: String? = nil, results: [PokemonInfo]) {
        self.next = next
        self.results = results
    }
    
    init(from: ListDto) {
        self.next = from.next
        results = (from.results ?? []).map({PokemonInfo(from: $0)})
    }
}
