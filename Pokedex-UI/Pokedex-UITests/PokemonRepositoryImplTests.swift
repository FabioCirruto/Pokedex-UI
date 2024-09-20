//
//  PokemonRepositoryImplTests.swift
//  Pokedex-UITests
//
//  Created by Fabio Cirruto on 20/09/24.
//

import XCTest
import Factory
@testable import Pokedex_UI

final class PokemonRepositoryImplTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        Container.shared.reset()
        Container.shared.pokemonService.register { PokemonServiceMockImpl() }
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_getPokemonList_array_decoding() async throws {
        let repository = Container.shared.pokemonRepository.resolve()
        
        let pokemonList = try await repository.getPokemonList(limit: 3, offset: 0)
        
        XCTAssertEqual(pokemonList.next, "https://pokeapi.co/api/v2/pokemon/?offset=20&limit=20")
        XCTAssertEqual(pokemonList.results[0].name, "bulbasaur")
        XCTAssertEqual(pokemonList.results[1].name, "ivysaur")
        XCTAssertEqual(pokemonList.results[2].name, "venusaur")
    }
    
    func test_getPokemon_entities_well_formed() async throws {
        let repository = Container.shared.pokemonRepository.resolve()
        
        let pokemon = try await repository.getPokemon(url: "https://pokeapi.co/api/v2/pokemon/1/")
        
        XCTAssertEqual(pokemon.name, "bulbasaur")
        XCTAssertEqual(pokemon.desc, "A strange seed was planted on its back at birth. The plant sprouts and grows with this POKéMON.")
        XCTAssertEqual(pokemon.image, "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png")
        XCTAssertEqual(pokemon.types.count, 2)
        XCTAssertEqual(pokemon.types[0].name, "Grass")
        XCTAssertEqual(pokemon.types[1].name, "Poison")
    }

}
