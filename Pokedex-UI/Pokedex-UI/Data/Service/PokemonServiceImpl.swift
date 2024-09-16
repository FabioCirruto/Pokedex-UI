//
//  PokemonServiceImpl.swift
//  Pokedex-UI
//
//  Created by Fabio Cirruto on 16/09/24.
//

import Foundation

class PokemonServiceImpl: PokemonService {
    func getPokemonList(limit: Int, offset: Int) async throws -> ListDto {
        return try await RequestProvider.shared.request(source: EndPoint.List(limit, offset), of: ListDto.self)
    }
}
