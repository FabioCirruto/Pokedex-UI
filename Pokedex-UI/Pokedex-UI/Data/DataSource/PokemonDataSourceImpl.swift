//
//  PokemonDataSourceImpl.swift
//  Pokedex-UI
//
//  Created by Fabio Cirruto on 16/09/24.
//

import Foundation
import Factory

class PokemonDataSourceImpl: PokemonDataSource {
    
    @Injected(\.pokemonService) private var service
    
    func getPokemonList(limit: Int, offset: Int) async throws -> ListDto {
        return try await service.getPokemonList(limit: limit, offset: offset)
    }
    
    
}
