//
//  ContentView.swift
//  AllAboutGif
//
//  Created by Kaique Magno Dos Santos on 14/06/19.
//  Copyright © 2019 Kaique Magno Dos Santos. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @ObservedObject var gifBindableManager = GifBindableManager()
    
    var body: some View {
        VStack {
            Button(action: {
                self.gifBindableManager.load()
            }) {
                Text("Request Random Gif")
            }
            List(self.gifBindableManager.gifs) { gif in
                GifCell(title: gif.title.isEmpty ? gif.id : gif.title,
                        imageURLPath: gif.gif?.url ?? "https://media.giphy.com/media/smGpsxCQzXwDS/giphy.gif")
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
