//
//  GifBindableManager.swift
//  AllAboutGif
//
//  Created by Kaique Magno Dos Santos on 01/08/19.
//  Copyright © 2019 Kaique Magno Dos Santos. All rights reserved.
//

import Combine
import SwiftUI

final class GifBindableManager: BindableObject {
    let didChange = PassthroughSubject<[Gif], Never>()
    
    var gifs:[Gif] = [Gif]()
    
    func load() {
        APIManager.requestReandomGif(searchTerm: "Lost") { (result) in
            switch result {
            case .success(let response):
                self.gifs = response.results
                DispatchQueue.main.async {
                    print(self.gifs)
                    self.didChange.send(self.gifs)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
