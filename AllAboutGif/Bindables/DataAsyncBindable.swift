//
//  DataBindable.swift
//  AllAboutGif
//
//  Created by Kaique Magno Dos Santos on 01/08/19.
//  Copyright © 2019 Kaique Magno Dos Santos. All rights reserved.
//

import Combine
import SwiftUI

final class DataAsyncBindable: ObservableObject {
    @Published var data = Data()
    
    init(urlPath: String) {
        guard let url = URL(string: urlPath) else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let self = self else { return }
            guard let data = data else { return }

            DispatchQueue.main.async { self.data = data }
            
            }.resume()
    }
}
