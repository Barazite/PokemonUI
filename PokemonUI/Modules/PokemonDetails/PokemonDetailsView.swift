//
//  PokemonDetailsView.swift
//  PokemonUI
//
//  Created by Adrian Sevilla Diaz on 19/1/22.
//

import SwiftUI

struct PokemonDetailsView: View {
    
    let pokemon: Pokemon
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var imageManager = ImageManager()
    
    var body: some View {
        ScrollView{
            PokemonCarrousel(pokemon: self.pokemon, imageManager: self.imageManager)
                .padding(8)
            VStack{
                Text("\(pokemon.name)")
                    .font(.title)
                    .bold()
                    .padding(8)
                
                PokemonTypes(types: pokemon.types!)
                
                PokemonMeasures(height: Float(pokemon.height!), weight: Float(pokemon.weight!))
                    .padding(.vertical, 20)
                
                Text("Base Stats")
                    .bold()
                    .font(.title3)
                    .padding()
                
                
            }
            .frame(maxWidth: .infinity)
            .background(rounded().fill(Color.bluePokemon))
        }
        .onAppear(perform: {
            self.imageManager.getFrontImageFromUrl(imageUrl: self.pokemon.frontImage!)
            self.imageManager.getBackImageFromUrl(imageUrl: self.pokemon.backImage!)
        })
        .background(Color.yellowPokemon)
        .ignoresSafeArea(edges: [.horizontal, .bottom])
        .navigationTitle("\(pokemon.name)")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
                                Button(action: {presentationMode.wrappedValue.dismiss()}, label: {
                                    Image(systemName: "chevron.backward")
                                        .foregroundColor(.white)
                                }))
    }
}

struct PokemonDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailsView(pokemon: Pokemon(id: 120, name: "Pikachu", types: ["electric", "normal"], weight: 62, height: 35, frontImage: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png", backImage: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/25.png", stats: ["hp" : 35, "attack" : 55, "defense" : 40, "special-attack" : 50, "special-defense" : 50, "speed" : 90], artwork: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/154.png"))
    }
}

struct PokemonCarrousel : View{
    let pokemon : Pokemon
    @State var showBackImage = false
    @ObservedObject var imageManager : ImageManager
    
    @ViewBuilder
    var body: some View{
        ZStack{
            if self.showBackImage{
                Image(uiImage: ((self.imageManager.back.isEmpty ? UIImage(named: "Pokemon_logo") : UIImage(data: self.imageManager.back))!))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 250, alignment: .center)
                    .cornerRadius(8)
            }else{
                Image(uiImage: ((self.imageManager.front.isEmpty ? UIImage(named: "Pokemon_logo") : UIImage(data: self.imageManager.front))!))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 250, alignment: .center)
                    .cornerRadius(8)
            }
            
            VStack{
                Spacer()
                Text("#" + String(format: "%04d", self.pokemon.id))
                    .font(.body)
                    .bold()
                    .foregroundColor(.bluePokemon)
                    .offset(CGSize(width: 100.0, height: 0))
            }
            
            HStack{
                if showBackImage{
                    Button(action: {showBackImage = false}, label: {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .frame(width: 15, height: 20)
                            .foregroundColor(.bluePokemon)
                    })
                    Spacer()
                }else{
                    Spacer()
                    Button(action: {showBackImage = true}, label: {
                        Image(systemName: "chevron.right")
                            .resizable()
                            .frame(width: 15, height: 20)
                            .foregroundColor(.bluePokemon)
                    })
                }
            }
        }
    }
}

struct PokemonTypes: View{
    
    let types : [String]
    
    var body: some View{
        HStack(alignment: .center){
            ForEach(self.types, id: \.self){ type in
                Text(type.uppercased())
                    .font(.subheadline)
                    .padding(.vertical, 5)
                    .padding(.horizontal,12)
                    .frame(maxWidth: 120)
                    .background(Color.getColorType(type: type))
                    .foregroundColor(.black)
                    .clipShape(Capsule())
                    .padding(.horizontal, 12)
                //                    .overlay(
                //                        Capsule()
                //                            .stroke(LinearGradient(gradient: Gradient(colors: [Color.black, Color.white]), startPoint: .leading, endPoint: .trailing), lineWidth: 2)
                //                    )
            }
        }
    }
}

struct PokemonMeasures: View{
    
    let height : Float
    let weight : Float
    
    var body: some View{
        VStack{
            HStack(alignment: .center){
                Text(String(format: "%.2f", self.weight/10) + "KG")
                    .bold()
                    .font(.title3)
                    .frame(maxWidth: 120)
                    .padding(.horizontal, 12)
                
                Text(String(format: "%.2f", self.height/10) + "M")
                    .bold()
                    .font(.title3)
                    .frame(maxWidth: 120)
                    .padding(.horizontal, 12)
            }
            
            HStack(alignment: .center){
                Text("Weight")
                    .font(.callout)
                    .frame(maxWidth: 120)
                    .padding(.horizontal, 12)
                
                Text("Height")
                    .font(.callout)
                    .frame(maxWidth: 120)
                    .padding(.horizontal, 12)
            }
        }
    }
}


struct rounded: Shape{
    func path(in rect: CGRect) -> Path{
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 30, height: 30))
        return Path(path.cgPath)
    }
}
