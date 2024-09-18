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
    
    func getPokemon(url: String) async throws -> Pokemon {
        do {
            let dto = try await dataSource.getPokemon(url: url)
            let dtoDesc = try await dataSource.getPokemonDesc(url: dto.species?.url ?? "")
            return Pokemon(info: dto, desc: dtoDesc)
        } catch (let error) {
            throw(error)
        }
    }
}
