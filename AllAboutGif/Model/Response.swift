//
//  Response.swift
//  AllAboutGif
//
//  Created by Kaique Magno Dos Santos on 31/07/19.
//  Copyright © 2019 Kaique Magno Dos Santos. All rights reserved.
//

import Foundation

struct Response {
    enum CondingKeys: String, CodingKey {
        case results
        case next
    }
    
    let results: [Gif]
    let next: Int
}

extension Response: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CondingKeys.self)
        
        let results = try container.decode([Gif].self, forKey: .results)
        let nextValue = try container.decode(String.self, forKey: .next)
        let next = Int(nextValue) ?? 0
        
        self.init(results: results, next: next)
    }
}
