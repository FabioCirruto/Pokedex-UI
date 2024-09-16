//
//  PokemonRepositoryImpl.swift
//  Pokedex-UI
//
//  Created by Fabio Cirruto on 16/09/24.
//

import Foundation
import Factory

class PokemonRepositoryImpl: PokemonRepoistory {
    @Injected(\.pokemonDataSource) private var dataSource
    
    func getPokemonList(limit: Int, offset: Int) async throws -> ListPokemon {
        do {
            let dto = try await dataSource.getPokemonList(limit: limit, offset: offset)
            return ListPokemon(from: dto)
        } catch (let error) {
            throw(error)
        }
    }
}
