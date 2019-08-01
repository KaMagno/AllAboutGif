//
//  Gif.swift
//  AllAboutGif
//
//  Created by Kaique Magno Dos Santos on 31/07/19.
//  Copyright © 2019 Kaique Magno Dos Santos. All rights reserved.
//

import SwiftUI

struct Gif: Identifiable {
    enum CodingKeys: String, CodingKey{
        case id
        case title
        case media
    }
    
    let id: String
    let title: String
    let media: [String:Media]
    var gif: Media? {
        return self.media["gif"]
    }
}

extension Gif: Decodable {
    init(from decoder:Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let id = try container.decode(String.self, forKey: .id)
        let title = try container.decode(String.self, forKey: .title)
        let mediaValue = try container.decode([[String:Media]].self, forKey: .media)
        var media:[String:Media] = [String:Media]()
        for anyMedia in mediaValue {
            media.merge(dict: anyMedia)
        }
        
        self.init(id: id, title: title, media: media)
    }
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
