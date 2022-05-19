//
//  PokemonListPresenter.swift
//  PokemonUI
//
//  Created by Adrian Sevilla Diaz on 17/1/22.
//

import Foundation

protocol PokemonListPresenterProtocol: BasePresenterProtocol {
    func pokemonsFromInteractor(data: [Pokemon], total: Int, nextURL: String?)
}

class PokemonListPresenterImpl: BasePresenter, ObservableObject{
    
    @Published var pokemonsList: [Pokemon] = []
    @Published var finalList: Bool = false
    
    var url = "https://pokeapi.co/api/v2/pokemon?limit=50&offset=0"
    
    var interactor: PokemonListInteractorProtocol? { return super.baseInteractor as? PokemonListInteractorProtocol}
    
    func fetchPokemons(){
        self.interactor?.fetchDataPokemonListInteractor(url: url)
    }
}

extension PokemonListPresenterImpl: PokemonListPresenterProtocol{
    func pokemonsFromInteractor(data: [Pokemon], total: Int, nextURL: String?){
        self.pokemonsList.append(contentsOf: data)
        self.pokemonsList.sort{$0.id < $1.id}
        if self.pokemonsList.count == total{
            finalList = true
        }else{
            self.url = nextURL ?? ""
            fetchPokemons()
        }
    }
}
