//
//  PokemonViewModel.swift
//  Pokedex-UI
//
//  Created by Fabio Cirruto on 16/09/24.
//

import Foundation
import Factory

@MainActor class PokemonViewModel: ObservableObject {
    @Injected(\.pokemonUseCase) private var useCase
    
    @Published var pokemonList: [PokemonInfo]?
    
    func download() {
        Task {
            await getPokemonList()
        }
    }
    
    private func getPokemonList() async {
        do {
            let pokemon = try await useCase.getPokemonList(limit: 101, offset: 0)
            pokemonList = pokemon.results
        } catch (let error) {
            print(error.localizedDescription)
        }
    }
}
