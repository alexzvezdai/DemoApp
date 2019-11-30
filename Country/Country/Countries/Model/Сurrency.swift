//
//  Сurrency.swift
//  Country
//
//  Created by Александр Звездай on 01.12.2019.
//  Copyright © 2019 Александр Звездай. All rights reserved.
//

import Foundation

struct Currency: Decodable, Encodable {
    let code: String
    let name: String
    let symbol: String
}
extension Currency {
    enum CodingKeys: String, CodingKey {
        case code
        case name
        case symbol
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(code, forKey: .code)
        try container.encode(name, forKey: .name)
        try container.encode(symbol, forKey: .symbol)
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        code = try container.decode(String.self, forKey: .code)
        name = try container.decode(String.self, forKey: .name)
        symbol = try container.decode(String.self, forKey: .symbol)
    }
}
