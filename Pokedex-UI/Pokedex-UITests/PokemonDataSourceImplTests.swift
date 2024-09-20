//
//  PokemonDataSourceImplTests.swift
//  Pokedex-UITests
//
//  Created by Fabio Cirruto on 19/09/24.
//

import XCTest
import Factory
@testable import Pokedex_UI

final class PokemonDataSourceImplTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        Container.shared.reset()
        Container.shared.pokemonService.register { PokemonServiceMockImpl() }
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_getPokemonList_array_composition() async throws {
        let dataSource = Container.shared.pokemonDataSource.resolve()
        
        let pokemonList = try await dataSource.getPokemonList(limit: 3, offset: 0)
        XCTAssertEqual(pokemonList.count, 3)
        XCTAssertEqual(pokemonList.next, "https://pokeapi.co/api/v2/pokemon/?offset=20&limit=20")
        XCTAssertNil(pokemonList.previous)
        
        XCTAssertEqual(pokemonList.results?[0].name, "bulbasaur")
        XCTAssertEqual(pokemonList.results?[0].url, "https://pokeapi.co/api/v2/pokemon/1/")
        XCTAssertEqual(pokemonList.results?[1].name, "ivysaur")
        XCTAssertEqual(pokemonList.results?[1].url, "https://pokeapi.co/api/v2/pokemon/2/")
        XCTAssertEqual(pokemonList.results?[2].name, "venusaur")
        XCTAssertEqual(pokemonList.results?[2].url, "https://pokeapi.co/api/v2/pokemon/3/")
    }
    
    func test_getPokemon_entities_well_formed() async throws {
        let dataSource = Container.shared.pokemonDataSource.resolve()
        
        let pokemon = try await dataSource.getPokemon(url: "https://pokeapi.co/api/v2/pokemon/1/")
        
        XCTAssertEqual(pokemon.name, "bulbasaur")
        XCTAssertEqual(pokemon.sprites?.frontDefault, "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png")
        XCTAssertEqual(pokemon.types?.count, 2)
        XCTAssertEqual(pokemon.types?[0].type.name, "grass")
        XCTAssertEqual(pokemon.types?[1].type.name, "poison")
        XCTAssertEqual(pokemon.species?.url, "https://pokeapi.co/api/v2/pokemon-species/1/")
    }
    
    func test_getPokemonDesc_entities_well_formed() async throws {
        let dataSource = Container.shared.pokemonDataSource.resolve()
        
        let pokemonDesc = try await dataSource.getPokemonDesc(url: "https://pokeapi.co/api/v2/pokemon-species/1/")
        
        XCTAssertEqual(pokemonDesc.flavorTextEntries?[0].flavorText, "A strange seed was planted on its back at birth. The plant sprouts and grows with this POKéMON.")
    }
}
