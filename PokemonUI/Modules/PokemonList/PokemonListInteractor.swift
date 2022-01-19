//
//  PokemonListInteractor.swift
//  PokemonUI
//
//  Created by Adrian Sevilla Diaz on 17/1/22.
//

import Foundation
import Alamofire

protocol PokemonListInteractorProtocol: BaseInteractorProtocol {
    func fetchDataPokemonListInteractor(url: String)
}

class PokemonListInteractorImpl: BaseInteractor{
    weak var presenter: PokemonListPresenterProtocol? { return super.basePresenter as? PokemonListPresenterProtocol}
}

extension PokemonListInteractorImpl: PokemonListInteractorProtocol{
    func fetchDataPokemonListInteractor(url: String){
        var pokemonsList : [Pokemon] = []
        AF.request(url).responseDecodable(of: PokemonsListServerModel.self){ response in
            guard let pokemonsResponse = response.value else
            {
                return
            }
            pokemonsResponse.results?.forEach{
                AF.request($0.url!).responseDecodable(of: PokemonServerModel.self){ pokemon in
                    guard let pokemonUnit = pokemon.value else
                    {
                        return
                    }
                    pokemonsList.append(Pokemon(businessModel: pokemonUnit))
                    if pokemonsList.count == 50
                    {
                        pokemonsList.sort{$0.id < $1.id}
                        self.presenter?.pokemonsFromInteractor(data: pokemonsList, total: pokemonsResponse.count ?? 0, nextURL: pokemonsResponse.next ?? "")
                    }
                }
            }
        }
    }
}
