//
//  ContentView.swift
//  AllAboutGif
//
//  Created by Kaique Magno Dos Santos on 14/06/19.
//  Copyright © 2019 Kaique Magno Dos Santos. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @ObjectBinding var gifBindableManager = GifBindableManager()
    
    var body: some View {
        VStack {
            Button(action: {
                self.gifBindableManager.load()
            }) {
                Text("Request Random Gif")
            }
            List(self.gifBindableManager.gifs.identified(by: \.id)) { gif in
                Text(gif.id)
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
