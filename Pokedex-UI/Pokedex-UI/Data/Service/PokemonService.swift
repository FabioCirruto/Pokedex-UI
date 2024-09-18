//
//  PokemonService.swift
//  Pokedex-UI
//
//  Created by Fabio Cirruto on 16/09/24.
//

import Foundation

protocol PokemonService {
    func getPokemonList(limit: Int, offset: Int) async throws -> ListDto
    
    func getPokemon(url: String) async throws -> PokemonDto
    
    func getPokemonDesc(url: String) async throws -> PokemonDescDto
}
