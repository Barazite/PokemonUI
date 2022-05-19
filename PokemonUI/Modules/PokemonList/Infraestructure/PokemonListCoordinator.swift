//
//  PokemonListCoordinator.swift
//  PokemonUI
//
//  Created by Adrian Sevilla Diaz on 17/1/22.
//

import Foundation
import SwiftUI

final class PokemonListCoordinator: BaseCoordinator{
    static func navigation() -> NavigationView<PokemonListView>{
        let customNavigationView = NavigationView{
            self.buildView()
        }
        return customNavigationView
    }
    static func buildView() -> PokemonListView{
        var view = PokemonListView()
        let vip = BaseCoordinator.assembly(presenter: PokemonListPresenterImpl.self, interactor: PokemonListInteractorImpl.self)
        view.presenter = vip.presenter
        return view
    }
}
