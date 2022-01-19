//
//  PokemonUIApp.swift
//  PokemonUI
//
//  Created by Adrian Sevilla Diaz on 17/1/22.
//

import SwiftUI

@main
struct PokemonUIApp: App {
    var body: some Scene {
        WindowGroup {
            PokemonListCoordinator.navigation()
        }
    }
}
