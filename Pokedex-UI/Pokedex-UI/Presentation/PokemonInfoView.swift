//
//  PokemonInfoView.swift
//  Pokedex-UI
//
//  Created by Fabio Cirruto on 18/09/24.
//

import SwiftUI

struct PokemonInfoView: View {
    
    var pokemon: Pokemon
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            AsyncImage(url: URL(string: pokemon.image))
            
            VStack(alignment: .leading) {
                Text(pokemon.name.capitalized)
                    .bold()
                
                HStack {
                    ForEach(pokemon.types) { type in
                        Text(type.name.capitalized)
                            .bold()
                            .foregroundStyle(.gray)
                            .padding(10)
                            .background(.gray.opacity(0.2))
                            .cornerRadius(15)
                    }
                }
                
                Text(pokemon.desc)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
            }
        }
        .padding()
    }
}

#Preview {
    PokemonInfoView(pokemon: Pokemon(name: "Bulbasaur", image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png", types: [Types(name: "grass")], desc: "A strange seed was planted on its back at birth. The plant sprouts and grows with\nthis POKéMON."))
}
