//
//  ListDto.swift
//  Pokedex-UI
//
//  Created by Fabio Cirruto on 16/09/24.
//

import Foundation

struct ListDto: Codable {
    var count: Int?
    var next: String?
    var previous: String?
    var results: [PokemonInfoDto]?
}
