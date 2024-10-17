//
//  PokemonInfoView.swift
//  Pokedex-UI
//
//  Created by Fabio Cirruto on 18/09/24.
//

import SwiftUI

struct PokemonInfoView: View {
    init(pokemon: Pokemon, bundle: Bundle?) {
        self.pokemon = pokemon
        self.bundle = bundle
    }
    
    
    var pokemon: Pokemon
    let bundle: Bundle?
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            AsyncImage(url: URL(string: pokemon.image)) { phase in
                switch phase {
                case .empty:
                    Image(uiImage: UIImage(named: "bulbasaur", in: bundle, with: nil)!)
                        .frame(width: 96, height: 96)
                case .success(let image):
                    image
                        .frame(width: 96, height: 96)
                case .failure:
                    Image(uiImage: UIImage(named: "bulbasaur", in: bundle, with: nil)!)
                        .frame(width: 96, height: 96)
                @unknown default:
                    Image(uiImage: UIImage(named: "bulbasaur", in: bundle, with: nil)!)
                        .frame(width: 96, height: 96)
                }
            }
            
            
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
    PokemonInfoView(pokemon: Pokemon(name: "Bulbasaur", image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png", types: [Types(name: "grass")], desc: "A strange seed was planted on its back at birth. The plant sprouts and grows with\nthis POKéMON."), bundle: nil)
 }

//struct PokemonInfoView_Preview: PreviewProvider {
//    static var previews: some View {
//        snapshots.previews.previewLayout(.sizeThatFits)
//    }
//    
//    static var snapshots: PreviewSnapshots<String> {
//        PreviewSnapshots(configurations: [
//            .init(name: "Default", state: "bulbasaur preview")
//        ], configure: { state in
//            PokemonInfoView(pokemon: Pokemon(name: "Bulbasaur", image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png", types: [Types(name: "grass")], desc: "A strange seed was planted on its back at birth. The plant sprouts and grows with\nthis POKéMON."))
//        })
//    }
//}
