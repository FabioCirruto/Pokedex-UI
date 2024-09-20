//
//  PokemonServiceMockImpl.swift
//  Pokedex-UI
//
//  Created by Fabio Cirruto on 19/09/24.
//

import Foundation

class PokemonServiceMockImpl: PokemonService {
    func getPokemonList(limit: Int, offset: Int) async throws -> ListDto {
        return ListDto(
            count: 3,
            next: "https://pokeapi.co/api/v2/pokemon/?offset=20&limit=20",
            previous: nil,
            results: [
                PokemonInfoDto(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/"),
                PokemonInfoDto(name: "ivysaur", url: "https://pokeapi.co/api/v2/pokemon/2/"),
                PokemonInfoDto(name: "venusaur", url: "https://pokeapi.co/api/v2/pokemon/3/")
            ]
        )
    }
    
    func getPokemon(url: String) async throws -> PokemonDto {
        return PokemonDto(
            name: "bulbasaur",
            sprites: ImagesDto(
                frontDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png"
            ),
            types: [
                TypeDto(
                    slot: 1,
                    type: PokemonTypeDto(
                        name: "grass",
                        url: "https://pokeapi.co/api/v2/type/12/"
                    )
                ),
                TypeDto(
                    slot: 2,
                    type: PokemonTypeDto(
                        name: "poison",
                        url: "https://pokeapi.co/api/v2/type/4/"
                    )
                ),
            ],
            species: SpeciesInfoDto(
                name: "bulbasaur",
                url: "https://pokeapi.co/api/v2/pokemon-species/1/"
            )
        )
    }
    
    func getPokemonDesc(url: String) async throws -> PokemonDescDto {
        return PokemonDescDto(
            flavorTextEntries: [
                FlavorTextEntriesDto(
                    flavorText: "A strange seed was planted on its back at birth. The plant sprouts and grows with this POKéMON."
                )
            ]
        )
    }
}
