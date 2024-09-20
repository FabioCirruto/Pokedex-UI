//
//  PokemonViewModel.swift
//  Pokedex-UI
//
//  Created by Fabio Cirruto on 16/09/24.
//

import Foundation
import Factory
import Combine

@MainActor class PokemonViewModel: ObservableObject {
    @Injected(\.pokemonUseCase) private var useCase
    
    @Published var pokemonList: [PokemonInfo]?
    @Published var pokemon: Pokemon?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscriptions()
    }
    
    deinit {
        cancellables.removeAll()
    }
    
    func fetchData() async {
        do {
            self.pokemonList = try await getPokemonList().results
        } catch (let error) {
            print(error.localizedDescription)
        }
    }
    
    func getInfoPokemon(url: String) async throws {
        do {
            self.pokemon = try await getPokemon(url: url)
        } catch (let error) {
            print(error.localizedDescription)
        }
    }
    
    private func setupSubscriptions() {
        $pokemonList
            .sink { [weak self] newPokemonList in
                if let newList = newPokemonList, let first = newList.first  {
                    Task {
                        try await self?.getInfoPokemon(url: first.detail)
                    }
                }
            }
            .store(in: &cancellables)
    }
    
    private func getPokemonList() async throws -> ListPokemon {
        return try await useCase.getPokemonList(limit: 101, offset: 0)
    }
    
    private func getPokemon(url: String) async throws -> Pokemon {
        return try await useCase.getPokemon(url: url)
    }
}
