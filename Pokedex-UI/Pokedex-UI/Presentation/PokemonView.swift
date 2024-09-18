//
//  PokemonView.swift
//  Pokedex-UI
//
//  Created by Fabio Cirruto on 16/09/24.
//

import SwiftUI

struct PokemonView: View {
    
    @ObservedObject var viewModel: PokemonViewModel = PokemonViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20) {
                if let pokemon = viewModel.pokemon {
                    PokemonInfoView(pokemon: pokemon)
                }
                
                List {
                    ForEach(viewModel.pokemonList ?? [], id: \.self) { pokemon in
                        Text(pokemon.name)
                            .onTapGesture {
                                viewModel.getInfoPokemon(url: pokemon.detail)
                            }
                    }
                }
                
            }.onAppear {
                viewModel.download()
            }
            .navigationTitle("Pokemon-UI")
        }
    }
}

#Preview {
    PokemonView()
}
