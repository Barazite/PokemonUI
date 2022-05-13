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
    var stats : [String:Float] = [:]
    
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
            switch $0.stat?.name{
            case "hp":self.stats.updateValue(Float($0.baseStat ?? 0), forKey: "HP")
            case "attack":self.stats.updateValue(Float($0.baseStat ?? 0), forKey: "ATK")
            case "defense":self.stats.updateValue(Float($0.baseStat ?? 0), forKey: "DEF")
            case "special-defense":self.stats.updateValue(Float($0.baseStat ?? 0), forKey: "SPD")
            case "special-attack":self.stats.updateValue(Float($0.baseStat ?? 0), forKey: "SPA")
            case "speed":self.stats.updateValue(Float($0.baseStat ?? 0), forKey: "SPE")
            default:
                break
            }
        }
    }
    
    init (id: Int, name: String, types: [String], weight: Int, height: Int, frontImage: String, backImage: String, stats : [String: Float], artwork: String){
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
