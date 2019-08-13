//
//  GifBindableManager.swift
//  AllAboutGif
//
//  Created by Kaique Magno Dos Santos on 01/08/19.
//  Copyright © 2019 Kaique Magno Dos Santos. All rights reserved.
//

import Combine
import SwiftUI

final class GifBindableManager: ObservableObject {
    @Published var gifs:[Gif] = [Gif]()
    
    func load() {
        APIManager.requestReandomGif(searchTerm: "Lost") { (result) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else {return}
                    self.gifs = response.results
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
