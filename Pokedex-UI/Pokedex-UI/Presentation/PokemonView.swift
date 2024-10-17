//
//  PokemonView.swift
//  Pokedex-UI
//
//  Created by Fabio Cirruto on 16/09/24.
//

import SwiftUI
import Factory
import PreviewSnapshots

struct PokemonView: View {
    
    @ObservedObject var viewModel: PokemonViewModel = PokemonViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20) {
                if let pokemon = viewModel.pokemon {
                    PokemonInfoView(pokemon: pokemon, bundle: nil)
                }
                
                List {
                    ForEach(viewModel.pokemonList ?? [], id: \.self) { pokemon in
                        Text(pokemon.name)
                            .onTapGesture {
                                Task {
                                    try await viewModel.getInfoPokemon(url: pokemon.detail)
                                }
                            }
                    }
                }
                
            }.onAppear {
                Task {
                    await viewModel.fetchData()
                }
            }
            .navigationTitle("Pokemon-UI")
        }
    }
}

#Preview {
    let _ = Container.shared.pokemonService.register { PokemonServiceMockImpl() }
    return PokemonView()
}
