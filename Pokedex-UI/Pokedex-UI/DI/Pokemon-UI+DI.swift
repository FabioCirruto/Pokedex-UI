//
//  Pokemon-UI+DI.swift
//  Pokedex-UI
//
//  Created by Fabio Cirruto on 16/09/24.
//

import Foundation
import Factory

extension Container {
    var pokemonService: Factory<PokemonService> {
        Factory(self) { PokemonServiceImpl() }
    }
    
    var pokemonDataSource: Factory<PokemonDataSource> {
        Factory(self) { PokemonDataSourceImpl() }
    }
    
    var pokemonRepository: Factory<PokemonRepoistory> {
        Factory(self) { PokemonRepositoryImpl() }
    }
    
    var pokemonUseCase: Factory<PokemonUseCase> {
        Factory(self) { PokemonUseCase() }
    }
}
