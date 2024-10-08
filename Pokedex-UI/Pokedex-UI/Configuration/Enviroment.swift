//
//  Enviroment.swift
//  Pokedex-UI
//
//  Created by Fabio Cirruto on 16/09/24.
//

import Foundation

enum EnviromentKey: String {
    case ApiUrl = "API_URL"
}

struct Enviroment {
    static var apiUrl: String = {
        var value = Bundle.main.infoDictionary?[EnviromentKey.ApiUrl.rawValue] as? String
        return value ?? ""
    }()
}
