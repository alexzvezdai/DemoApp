//
//  Country.swift
//  Country
//
//  Created by Александр Звездай on 30.11.2019.
//  Copyright © 2019 Александр Звездай. All rights reserved.
//

import Foundation

struct Country: Decodable {
    let name: String
    let capital: String
    let flag: URL
}

extension Country {
    enum CodingKeys: String, CodingKey {
        case name
        case capital
        case flag
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(capital, forKey: .capital)
        try container.encode(flag, forKey: .flag)
}
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        capital = try container.decode(String.self, forKey: .capital)
        flag = try container.decode(URL.self, forKey: .flag)
    }
}
