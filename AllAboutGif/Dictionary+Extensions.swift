//
//  Dictionary+Extensions.swift
//  AllAboutGif
//
//  Created by Kaique Magno Dos Santos on 01/08/19.
//  Copyright © 2019 Kaique Magno Dos Santos. All rights reserved.
//

import Foundation

extension Dictionary {
    mutating func merge(dict: [Key: Value]){
        for (k, v) in dict {
            updateValue(v, forKey: k)
        }
    }
}
