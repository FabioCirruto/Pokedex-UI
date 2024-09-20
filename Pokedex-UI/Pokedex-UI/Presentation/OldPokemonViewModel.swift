//
//  OldPokemonViewModel.swift
//  Pokedex-UI
//
//  Created by Fabio Cirruto on 19/09/24.
//

import Foundation
import Factory

@MainActor class OldPokemonViewModel: ObservableObject {
    @Injected(\.pokemonUseCase) private var useCase
    
    @Published var pokemonList: [PokemonInfo]?
    @Published var pokemon: Pokemon?
    
    func download() {
        Task {
            await getPokemonList()
            if let first = pokemonList?.first {
                getInfoPokemon(url: first.detail)
            }
        }
    }
    
    func getInfoPokemon(url: String) {
        Task {
            await getPokemon(url: url)
        }
    }
    
    private func getPokemonList() async {
        do {
            let pokemonLists = try await useCase.getPokemonList(limit: 101, offset: 0)
            pokemonList = pokemonLists.results
        } catch (let error) {
            print(error.localizedDescription)
        }
    }
    
    private func getPokemon(url: String) async {
        do {
            let pokemon = try await useCase.getPokemon(url: url)
            self.pokemon = pokemon
        } catch (let error) {
            print(error.localizedDescription)
        }
    }
}
