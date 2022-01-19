//
//  PokemonListView.swift
//  PokemonUI
//
//  Created by Adrian Sevilla Diaz on 17/1/22.
//

import SwiftUI

struct PokemonListView: View {
    
    @ObservedObject var presenter = PokemonListPresenterImpl()
    
    init(){
        UINavigationBar.appearance().barTintColor = UIColor(Color.redPokemon)
    }
    
    var body: some View {
        if self.presenter.pokemonsList.isEmpty{
            ProgressView("Cargando")
                .onAppear(perform: {
                    self.presenter.fetchPokemons()
                })
        }else{
            List{
                ForEach(self.presenter.pokemonsList){ pokemon in
                    PokemonCard(pokemon: pokemon)
                        .onAppear(perform: {
                            if self.presenter.pokemonsList.last?.id == pokemon.id && !self.presenter.finalList{
                                self.presenter.fetchPokemons()
                            }
                        })
                        .overlay(
                            NavigationLink(
                                destination: Text("\(pokemon.name)"),
                                label: {
                                    EmptyView()
                                })
                                .opacity(0)
                        )
                }
            }
            .listRowBackground(Color.bluePokemon)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .principal ){
                    Image("Pokemon_logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 60, alignment: .center)
                }
            }
        }
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}

struct PokemonCard: View {
    
    var pokemon : Pokemon
    @ObservedObject var imageManager = ImageManager()
    @State var imageShow = false
    
    var body: some View{
        HStack(alignment: .center){
            Image(uiImage: ((self.imageManager.front.isEmpty ? UIImage(named: "Pokemon_logo") : UIImage(data: self.imageManager.front))!))
                .renderingMode(!self.imageShow ? .template : .original)
                .resizable()
                .frame(width: 150, height: 150)
                .onTapGesture {
                    self.imageShow.toggle()
                }
            VStack{
                Spacer()
                Text(pokemon.name).font(.title3)
                Spacer()
                HStack{
                    Spacer()
                    Text("#" + String(format: "%04d", pokemon.id)).font(.footnote)
                        .padding(5)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color.yellowPokemon)
        .cornerRadius(8)
        .listRowBackground(Color.bluePokemon)
        .onAppear(){
            self.imageManager.getFrontImageFromUrl(imageUrl: self.pokemon.frontImage!)
        }
    }
}
