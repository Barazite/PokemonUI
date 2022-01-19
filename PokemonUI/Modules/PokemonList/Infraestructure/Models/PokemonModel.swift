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
        businessModel.types?.forEach{
            self.types?.append($0.type?.name ?? "")
        }
        businessModel.stats?.forEach{
            self.stats.updateValue($0.baseStat ?? 0, forKey: $0.stat?.name ?? "")
        }
    }
}
