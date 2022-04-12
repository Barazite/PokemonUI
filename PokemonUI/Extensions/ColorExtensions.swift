//
//  ColorExtensions.swift
//  PokemonUI
//
//  Created by Adrian Sevilla Diaz on 17/1/22.
//

import Foundation
import SwiftUI

extension Color{
    
    //Pokemon Logo Color Palette
    static let yellowPokemon = Color(red: 255/255, green: 203/255, blue: 5/255)
    static let bluePokemon = Color(red: 42/255, green: 117/255, blue: 187/255)
    static let redPokemon =  Color(red: 251/255, green: 27/255, blue: 27/255)
    static let darkYellowPokemon = Color(red: 199/255, green: 160/255, blue: 8/255)
    static let navyBluePokemon = Color(red: 0/255, green: 58/255, blue: 112/255)
    
    //Pokemon Types
    static let normalType = Color(red: 168/255, green: 160/255, blue: 144/255)
    static let fireType = Color(red: 240/255, green: 80/255, blue: 48/255)
    static let waterType = Color(red: 56/255, green: 153/255, blue: 248/255)
    static let grassType = Color(red: 120/255, green: 200/255, blue: 80/255)
    static let electricType = Color(red: 248/255, green: 208/255, blue: 48/255)
    static let iceType = Color(red: 88/255, green: 200/255, blue: 224/255)
    static let fightingType = Color(red: 160/255, green: 80/255, blue: 56/255)
    static let poisonType = Color(red: 176/255, green: 88/255, blue: 160/255)
    static let groundType = Color(red: 234/255, green: 214/255, blue: 164/255)
    static let flyingType = Color(red: 152/255, green: 168/255, blue: 240/255)
    static let psychicType = Color(red: 248/255, green: 112/255, blue: 160/255)
    static let bugType = Color(red: 168/255, green: 184/255, blue: 32/255)
    static let rockType = Color(red: 184/255, green: 160/255, blue: 88/255)
    static let ghostType = Color(red: 96/255, green: 96/255, blue: 176/255)
    static let dragonType = Color(red: 160/255, green: 80/255, blue: 56/255)
    static let darkType = Color(red: 122/255, green: 88/255, blue: 72/255)
    static let steelType = Color(red: 168/255, green: 168/255, blue: 192/255)
    static let fairyType = Color(red: 231/255, green: 159/255, blue: 231/255)
    
    static func getColorType(type: String) -> Color{
        var color : Color
        
        switch type {
        case "normal": color = Color.normalType
        case "fighting": color = Color.fightingType
        case "flying": color = Color.flyingType
        case "poison": color = Color.poisonType
        case "ground": color = Color.groundType
        case "rock": color = Color.rockType
        case "bug": color = Color.bugType
        case "ghost": color = Color.ghostType
        case "steel": color = Color.steelType
        case "fire": color = Color.fireType
        case "water": color = Color.waterType
        case "grass": color = Color.grassType
        case "electric": color = Color.electricType
        case "psychic": color = Color.psychicType
        case "ice": color = Color.iceType
        case "dragon": color = Color.dragonType
        case "dark": color = Color.darkType
        case "fairy": color = Color.fairyType
        default: color = Color.gray
        }
        return color
    }
}
