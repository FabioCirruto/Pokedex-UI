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
                    PokemonInfoView(pokemon: pokemon)
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
                
            }.task {
                await viewModel.fetchData()
            }
            .navigationTitle("Pokemon-UI")
        }
    }
}

//#Preview {
//    let _ = Container.shared.pokemonService.register { PokemonServiceMockImpl() }
//    return PokemonView()
//}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        let _ = Container.shared.pokemonService.register { PokemonServiceMockImpl() }
        snapshots.previews.previewLayout(.sizeThatFits)
    }

    static var snapshots: PreviewSnapshots<String> {
        let _ = Container.shared.pokemonService.register { PokemonServiceMockImpl() }
        return PreviewSnapshots(
            configurations: [
                .init(name: "Preview", state: "3 elementi"),
            ],
            configure: { state in
                PokemonView()
            }
        )
    }
}
