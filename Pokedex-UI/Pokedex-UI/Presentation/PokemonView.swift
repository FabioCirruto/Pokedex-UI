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
            VStack {
                List {
                    ForEach(viewModel.pokemonList ?? [], id: \.self) { pokemon in
                        Text(pokemon.name)
                    }
                }.onAppear {
                    viewModel.download()
                }
            }
            
            .navigationTitle("Pokedex-UI")
        }
    }
}

#Preview {
    PokemonView()
}
