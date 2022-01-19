//
//  PokemonServerModel.swift
//  PokemonUI
//
//  Created by Adrian Sevilla Diaz on 18/1/22.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let pokemonServerModel = try? newJSONDecoder().decode(PokemonServerModel.self, from: jsonData)

import Foundation

// MARK: - PokemonServerModel
struct PokemonServerModel: Codable {
    var abilities: [Ability]?
    var baseExperience: Int?
    var forms: [Species]?
    var gameIndices: [GameIndex]?
    var height: Int?
    var heldItems: [HeldItem]?
    var id: Int?
    var isDefault: Bool?
    var locationAreaEncounters: String?
    var moves: [Move]?
    var name: String?
    var order: Int?
    var species: Species?
    var sprites: Sprites?
    var stats: [Stat]?
    var types: [TypeElement]?
    var weight: Int?

    enum CodingKeys: String, CodingKey {
        case abilities = "abilities"
        case baseExperience = "base_experience"
        case forms = "forms"
        case gameIndices = "game_indices"
        case height = "height"
        case heldItems = "held_items"
        case id = "id"
        case isDefault = "is_default"
        case locationAreaEncounters = "location_area_encounters"
        case moves = "moves"
        case name = "name"
        case order = "order"
        case species = "species"
        case sprites = "sprites"
        case stats = "stats"
        case types = "types"
        case weight = "weight"
    }
}

// MARK: - Ability
struct Ability: Codable {
    var ability: Species?
    var isHidden: Bool?
    var slot: Int?

    enum CodingKeys: String, CodingKey {
        case ability = "ability"
        case isHidden = "is_hidden"
        case slot = "slot"
    }
}

// MARK: - Species
struct Species: Codable {
    var name: String?
    var url: String?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case url = "url"
    }
}

// MARK: - GameIndex
struct GameIndex: Codable {
    var gameIndex: Int?
    var version: Species?

    enum CodingKeys: String, CodingKey {
        case gameIndex = "game_index"
        case version = "version"
    }
}

// MARK: - HeldItem
struct HeldItem: Codable {
    var item: Species?
    var versionDetails: [VersionDetail]?

    enum CodingKeys: String, CodingKey {
        case item = "item"
        case versionDetails = "version_details"
    }
}

// MARK: - VersionDetail
struct VersionDetail: Codable {
    var rarity: Int?
    var version: Species?

    enum CodingKeys: String, CodingKey {
        case rarity = "rarity"
        case version = "version"
    }
}

// MARK: - Move
struct Move: Codable {
    var move: Species?
    var versionGroupDetails: [VersionGroupDetail]?

    enum CodingKeys: String, CodingKey {
        case move = "move"
        case versionGroupDetails = "version_group_details"
    }
}

// MARK: - VersionGroupDetail
struct VersionGroupDetail: Codable {
    var levelLearnedAt: Int?
    var moveLearnMethod: Species?
    var versionGroup: Species?

    enum CodingKeys: String, CodingKey {
        case levelLearnedAt = "level_learned_at"
        case moveLearnMethod = "move_learn_method"
        case versionGroup = "version_group"
    }
}

// MARK: - GenerationV
struct GenerationV: Codable {
    var blackWhite: Sprites?

    enum CodingKeys: String, CodingKey {
        case blackWhite = "black-white"
    }
}

// MARK: - GenerationIv
struct GenerationIv: Codable {
    var diamondPearl: Sprites?
    var heartgoldSoulsilver: Sprites?
    var platinum: Sprites?

    enum CodingKeys: String, CodingKey {
        case diamondPearl = "diamond-pearl"
        case heartgoldSoulsilver = "heartgold-soulsilver"
        case platinum = "platinum"
    }
}

// MARK: - Versions
struct Versions: Codable {
    var generationI: GenerationI?
    var generationIi: GenerationIi?
    var generationIii: GenerationIii?
    var generationIv: GenerationIv?
    var generationV: GenerationV?
    var generationVi: [String: Home]?
    var generationVii: GenerationVii?
    var generationViii: GenerationViii?

    enum CodingKeys: String, CodingKey {
        case generationI = "generation-i"
        case generationIi = "generation-ii"
        case generationIii = "generation-iii"
        case generationIv = "generation-iv"
        case generationV = "generation-v"
        case generationVi = "generation-vi"
        case generationVii = "generation-vii"
        case generationViii = "generation-viii"
    }
}

// MARK: - Sprites
class Sprites: Codable {
    var backDefault: String?
    var backFemale: String?
    var backShiny: String?
    var backShinyFemale: String?
    var frontDefault: String?
    var frontFemale: String?
    var frontShiny: String?
    var frontShinyFemale: String?
    var other: Other?
    var versions: Versions?
    var animated: Sprites?

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backFemale = "back_female"
        case backShiny = "back_shiny"
        case backShinyFemale = "back_shiny_female"
        case frontDefault = "front_default"
        case frontFemale = "front_female"
        case frontShiny = "front_shiny"
        case frontShinyFemale = "front_shiny_female"
        case other = "other"
        case versions = "versions"
        case animated = "animated"
    }
}

// MARK: - GenerationI
struct GenerationI: Codable {
    var redBlue: RedBlue?
    var yellow: RedBlue?

    enum CodingKeys: String, CodingKey {
        case redBlue = "red-blue"
        case yellow = "yellow"
    }
}

// MARK: - RedBlue
struct RedBlue: Codable {
    var backDefault: String?
    var backGray: String?
    var backTransparent: String?
    var frontDefault: String?
    var frontGray: String?
    var frontTransparent: String?

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backGray = "back_gray"
        case backTransparent = "back_transparent"
        case frontDefault = "front_default"
        case frontGray = "front_gray"
        case frontTransparent = "front_transparent"
    }
}

// MARK: - GenerationIi
struct GenerationIi: Codable {
    var crystal: Crystal?
    var gold: Gold?
    var silver: Gold?

    enum CodingKeys: String, CodingKey {
        case crystal = "crystal"
        case gold = "gold"
        case silver = "silver"
    }
}

// MARK: - Crystal
struct Crystal: Codable {
    var backDefault: String?
    var backShiny: String?
    var backShinyTransparent: String?
    var backTransparent: String?
    var frontDefault: String?
    var frontShiny: String?
    var frontShinyTransparent: String?
    var frontTransparent: String?

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backShiny = "back_shiny"
        case backShinyTransparent = "back_shiny_transparent"
        case backTransparent = "back_transparent"
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
        case frontShinyTransparent = "front_shiny_transparent"
        case frontTransparent = "front_transparent"
    }
}

// MARK: - Gold
struct Gold: Codable {
    var backDefault: String?
    var backShiny: String?
    var frontDefault: String?
    var frontShiny: String?
    var frontTransparent: String?

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backShiny = "back_shiny"
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
        case frontTransparent = "front_transparent"
    }
}

// MARK: - GenerationIii
struct GenerationIii: Codable {
    var emerald: Emerald?
    var fireredLeafgreen: Gold?
    var rubySapphire: Gold?

    enum CodingKeys: String, CodingKey {
        case emerald = "emerald"
        case fireredLeafgreen = "firered-leafgreen"
        case rubySapphire = "ruby-sapphire"
    }
}

// MARK: - Emerald
struct Emerald: Codable {
    var frontDefault: String?
    var frontShiny: String?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
    }
}

// MARK: - Home
struct Home: Codable {
    var frontDefault: String?
    var frontFemale: String?
    var frontShiny: String?
    var frontShinyFemale: String?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontFemale = "front_female"
        case frontShiny = "front_shiny"
        case frontShinyFemale = "front_shiny_female"
    }
}

// MARK: - GenerationVii
struct GenerationVii: Codable {
    var icons: DreamWorld?
    var ultraSunUltraMoon: Home?

    enum CodingKeys: String, CodingKey {
        case icons = "icons"
        case ultraSunUltraMoon = "ultra-sun-ultra-moon"
    }
}

// MARK: - DreamWorld
struct DreamWorld: Codable {
    var frontDefault: String?
    var frontFemale: String?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontFemale = "front_female"
    }
}

// MARK: - GenerationViii
struct GenerationViii: Codable {
    var icons: DreamWorld?

    enum CodingKeys: String, CodingKey {
        case icons = "icons"
    }
}

// MARK: - Other
struct Other: Codable {
    var dreamWorld: DreamWorld?
    var home: Home?
    var officialArtwork: OfficialArtwork?

    enum CodingKeys: String, CodingKey {
        case dreamWorld = "dream_world"
        case home = "home"
        case officialArtwork = "official-artwork"
    }
}

// MARK: - OfficialArtwork
struct OfficialArtwork: Codable {
    var frontDefault: String?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

// MARK: - Stat
struct Stat: Codable {
    var baseStat: Int?
    var effort: Int?
    var stat: Species?

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort = "effort"
        case stat = "stat"
    }
}

// MARK: - TypeElement
struct TypeElement: Codable {
    var slot: Int?
    var type: Species?

    enum CodingKeys: String, CodingKey {
        case slot = "slot"
        case type = "type"
    }
}
