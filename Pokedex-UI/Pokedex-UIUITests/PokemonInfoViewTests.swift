//
//  PokemonInfoViewTests.swift
//  Pokedex-UIUITests
//
//  Created by Fabio Cirruto on 17/10/24.
//
import PreviewSnapshotsTesting
import SnapshotTesting
import XCTest

@testable import Pokedex_UI
import SwiftUI

final class PokemonInfoViewTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_pokemonInfoView() throws {
        
        let pokemon = Pokemon(name: "Bulbasaur", image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png", types: [Types(name: "grass")], desc: "A strange seed was planted on its back at birth. The plant sprouts and grows with\nthis POKéMON.")
        
        let hostingController = UIHostingController(rootView: PokemonInfoView(pokemon: pokemon, bundle: Bundle(for: PokemonInfoViewTests.self)))
        
        assertSnapshot(of: hostingController, as: .image(on: .iPhoneXr), record: true)
    }
}
