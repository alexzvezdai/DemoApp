//
//  Language.swift
//  Country
//
//  Created by Александр Звездай on 30.11.2019.
//  Copyright © 2019 Александр Звездай. All rights reserved.
//

import Foundation

struct Language: Decodable, Encodable {
    let iso639_1: String
    let iso639_2: String
    let name: String
    let nativeName: String
}
    extension Language {
        enum CodingKeys: String, CodingKey {
            case iso639_1
            case iso639_2
            case name
            case nativeName
        }
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(iso639_1, forKey: .iso639_1)
            try container.encode(iso639_2, forKey: .iso639_2)
            try container.encode(name, forKey: .name)
            try container.encode(nativeName, forKey: .nativeName)
        }
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            iso639_1 = try container.decode(String.self, forKey: .iso639_1)
            iso639_2 = try container.decode(String.self, forKey: .iso639_2)
            name = try container.decode(String.self, forKey: .name)
            nativeName = try container.decode(String.self, forKey: .nativeName)
        }
}
