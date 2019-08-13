//
//  GifCell.swift
//  AllAboutGif
//
//  Created by Kaique Magno Dos Santos on 31/07/19.
//  Copyright © 2019 Kaique Magno Dos Santos. All rights reserved.
//

import SwiftUI

struct GifCell : View {
    @ObservedObject var dataBindable: DataAsyncBindable
    var title: String
    
    init(title: String, imageURLPath: String) {
        self.title = title
        self.dataBindable = DataAsyncBindable(urlPath: imageURLPath)
    }
    
    var body: some View {
        HStack {
            Image(uiImage: UIImage.gifImageWithData(dataBindable.data) ?? #imageLiteral(resourceName: "default"))
                .resizable()
                .frame(width: 40.0, height: 40.0)
            Text(title)
                .bold()
        }
    }
}

#if DEBUG
struct GifCell_Previews : PreviewProvider {
    static var previews: some View {
        GifCell(title: "Some text", imageURLPath: "https://media.giphy.com/media/CEK6VlVkjTZ5u/giphy.gif")
    }
}
#endif
