//
//  Gif.swift
//  AllAboutGif
//
//  Created by Kaique Magno Dos Santos on 31/07/19.
//  Copyright © 2019 Kaique Magno Dos Santos. All rights reserved.
//

import SwiftUI

struct Gif: Decodable, Identifiable {
    let id: String
    let title: String
    let media: [[String:Media]]
}

struct Media: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case url
        case previewUrl = "preview"
        case dimensions = "dims"
    }
    
    let url: String
    let previewUrl: String
    private let dimensions: [Int]
    var width: Int {
        return self.dimensions[0]
    }
    var height: Int {
        return self.dimensions[1]
    }
}
