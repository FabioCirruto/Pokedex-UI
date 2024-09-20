//
//  PokemonViewModelTests.swift
//  Pokedex-UITests
//
//  Created by Fabio Cirruto on 20/09/24.
//

import XCTest
import Factory
import Combine
@testable import Pokedex_UI

final class PokemonViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        Container.shared.reset()
        Container.shared.pokemonService.register { PokemonServiceMockImpl() }
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @MainActor
    func test_fetchData() async throws {
        let viewModel: PokemonViewModel = PokemonViewModel()
        await viewModel.fetchData()
        XCTAssertEqual(viewModel.pokemonList?.count, 3)
        XCTAssertEqual(viewModel.pokemonList?[0].name, "bulbasaur")
        XCTAssertEqual(viewModel.pokemonList?[0].detail, "https://pokeapi.co/api/v2/pokemon/1/")
        XCTAssertEqual(viewModel.pokemonList?[1].name, "ivysaur")
        XCTAssertEqual(viewModel.pokemonList?[1].detail, "https://pokeapi.co/api/v2/pokemon/2/")
        XCTAssertEqual(viewModel.pokemonList?[2].name, "venusaur")
        XCTAssertEqual(viewModel.pokemonList?[2].detail, "https://pokeapi.co/api/v2/pokemon/3/")
    }
    
    @MainActor
    func test_getInfoPokemon() async throws {
        let viewModel: PokemonViewModel = PokemonViewModel()
        try await viewModel.getInfoPokemon(url: "https://pokeapi.co/api/v2/pokemon/1/")
        XCTAssertEqual(viewModel.pokemon?.name, "bulbasaur")
        XCTAssertEqual(viewModel.pokemon?.image, "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png")
        XCTAssertEqual(viewModel.pokemon?.types.count, 2)
        XCTAssertEqual(viewModel.pokemon?.types[0].name, "Grass")
        XCTAssertEqual(viewModel.pokemon?.types[1].name, "Poison")
        XCTAssertEqual(viewModel.pokemon?.desc, "A strange seed was planted on its back at birth. The plant sprouts and grows with this POKéMON.")
    }

}
