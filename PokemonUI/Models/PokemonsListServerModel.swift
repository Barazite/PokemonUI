//
//  PokemonsListServerModel.swift
//  PokemonUI
//
//  Created by Adrian Sevilla Diaz on 17/1/22.
//

import Foundation

// MARK: - PokemonsListServerModel
struct PokemonsListServerModel: Codable {
    var count: Int?
    var next: String?
    var previous: String?
    var results: [ResultPokemon]?

    enum CodingKeys: String, CodingKey {
        case count = "count"
        case next = "next"
        case previous = "previous"
        case results = "results"
    }
}

// MARK: - Result
struct ResultPokemon: Codable, Identifiable {
    var id = UUID()
    var name: String?
    var url: String?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case url = "url"
    }
}
