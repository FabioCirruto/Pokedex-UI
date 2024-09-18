//
//  PokemonUseCase.swift
//  Pokedex-UI
//
//  Created by Fabio Cirruto on 16/09/24.
//

import Foundation
import Factory

class PokemonUseCase {
    @Injected(\.pokemonRepository) private var repository
    
    func getPokemonList(limit: Int, offset: Int) async throws -> ListPokemon {
        return try await repository.getPokemonList(limit: limit, offset: offset)
    }
    
    func getPokemon(url: String) async throws -> Pokemon {
        return try await repository.getPokemon(url: url)
    }
}
