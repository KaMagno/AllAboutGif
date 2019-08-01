//
//  GifCell.swift
//  AllAboutGif
//
//  Created by Kaique Magno Dos Santos on 31/07/19.
//  Copyright © 2019 Kaique Magno Dos Santos. All rights reserved.
//

import SwiftUI

struct GifCell : View {
    var image: UIImage = UIImage(imageLiteralResourceName: "default")
    var title: String = "Some text"
    var body: some View {
        HStack {
            Image(uiImage: image)
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
        GifCell()
    }
}
#endif
