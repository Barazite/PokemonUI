//
//  ImageManager.swift
//  PokemonUI
//
//  Created by Adrian Sevilla Diaz on 17/1/22.
//

import Foundation

class ImageManager: ObservableObject {
    
    @Published var front =  Data()
    @Published var back =  Data()
    
    internal func getFrontImageFromUrl(imageUrl: String){
        guard let url = URL(string: imageUrl) else {return}
        let task = URLSession.shared.dataTask(with: url){ data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.front = data
            }
        }
        task.resume()
    }
    
    internal func getBackImageFromUrl(imageUrl: String){
        guard let url = URL(string: imageUrl) else {return}
        let task = URLSession.shared.dataTask(with: url){ data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.back = data
            }
        }
        task.resume()
    }
}
