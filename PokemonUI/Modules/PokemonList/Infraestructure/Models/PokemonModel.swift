//
//  PokemonModel.swift
//  PokemonUI
//
//  Created by Adrian Sevilla Diaz on 18/1/22.
//

import Foundation

struct Pokemon: Identifiable {
    let id : Int
    let name: String
    var types: [String]? = []
    let weight: Int?
    let height: Int?
    let artwork: String?
    let frontImage: String?
    let backImage: String?
    var stats : [String:Int] = [:]
    
    init(businessModel: PokemonServerModel){
        self.id = businessModel.id ?? 0
        self.name = businessModel.name?.uppercased() ?? ""
        self.weight = businessModel.weight ?? 0
        self.height = businessModel.height ?? 0
        self.frontImage = businessModel.sprites?.frontDefault
        self.backImage = businessModel.sprites?.backDefault
        self.artwork = businessModel.sprites?.other?.officialArtwork?.frontDefault
        businessModel.types?.forEach{
            self.types?.append($0.type?.name ?? "")
        }
        businessModel.stats?.forEach{
            self.stats.updateValue($0.baseStat ?? 0, forKey: $0.stat?.name ?? "")
        }
    }
    
    init (id: Int, name: String, types: [String], weight: Int, height: Int, frontImage: String, backImage: String, stats : [String: Int], artwork: String){
        self.id = id
        self.name = name.uppercased()
        self.weight = weight
        self.height = height
        self.frontImage = frontImage
        self.backImage = backImage
        self.types = types
        self.stats = stats
        self.artwork = artwork
    }
}
