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
        GeometryReader{ reader in
            ScrollView{
                PokemonCarrousel(pokemon: self.pokemon, imageManager: self.imageManager)
                    .padding(8)
                
                VStack(spacing: 15){
                    Text("\(pokemon.name)")
                        .font(.title)
                        .bold()
                        .padding(.top, 8)
                    
                    PokemonTypes(types: pokemon.types!)
                    
                    PokemonMeasures(height: Float(pokemon.height!), weight: Float(pokemon.weight!))
                        
                    PokemonStats(stats: pokemon.stats)
                                        
                    Spacer()
                }
                .frame(maxWidth: .infinity, minHeight: reader.frame(in: .global).height-290)
                .background(rounded().fill(Color.bluePokemon))
            }
            .onAppear(perform: {
                self.imageManager.getFrontImageFromUrl(imageUrl: self.pokemon.frontImage)
                self.imageManager.getBackImageFromUrl(imageUrl: self.pokemon.backImage)
            })
            .background(Color.yellowPokemon)
            .ignoresSafeArea(edges: [.horizontal, .bottom])
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("\(pokemon.name)")
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:
                                    Button(action: {presentationMode.wrappedValue.dismiss()}, label: {
                Image(systemName: "chevron.backward")
                    .foregroundColor(.white)
            }))
        }
    }
}


struct PokemonDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailsView(pokemon: Pokemon(id: 120, name: "Pikachu", types: ["electric", "normal"], weight: 62, height: 35, frontImage: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png", backImage: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/25.png", stats: ["HP" : 35.0, "ATK" : 55.0, "DEF" : 40.0, "SPA" : 50.0, "SPD" : 50.0, "SPE" : 90.0], artwork: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/154.png"))
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
        .frame(height: 300)
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

struct PokemonStats: View {
    
    var stats: [String:Float]
    @State private var width = CGFloat(0)
    
    var body: some View{
        
        Text("Base Stats")
            .bold()
            .font(.title3)
            .padding(.bottom, 15)
        
        VStack(spacing: 20){
            ForEach(stats.keys.sorted(), id: \.self){ key in
                CustomRectangle(value: stats[key]!, key: key)
                    .padding(.horizontal, 20)
            }
        }
    }
}

struct CustomRectangle: View{
    var value : Float
    var key : String
    
    @State private var width = CGFloat(0)
    
    var body: some View{
        HStack(alignment: .top){
            Text("\(key)")
                .bold()
                .frame(width: 40)
            
            ZStack(alignment: .leading){
                RoundedRectangle(cornerRadius: 20)
                    .fill(.gray)
                    .frame(width: 160, height: 15)
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.yellowPokemon)
                    .frame(width:width, height: 15)
                    .animation(
                        .easeInOut(duration: 2),
                        value: self.width
                    )
                    .onAppear(){
                        let n = value/100.0
                        if n<1{
                            self.width = 160*CGFloat(n)
                        }else{
                            self.width = 160
                        }
                    }
            }
            .padding(.horizontal, 20)
            
            
            Text(String(format: "%2.0f", self.value))
                .bold()
                .frame(width: 40)
        }
    }
}


struct rounded: Shape{
    func path(in rect: CGRect) -> Path{
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 30, height: 30))
        return Path(path.cgPath)
    }
}
