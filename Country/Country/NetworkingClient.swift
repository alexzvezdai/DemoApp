//
//  NetworkingClient.swift
//  Country
//
//  Created by Александр Звездай on 01.12.2019.
//  Copyright © 2019 Александр Звездай. All rights reserved.
//

import Foundation
import Alamofire

class NetworkingClient {
    // отрефачить метод на проверку резалта через свитч
    static func execute(_ url: URL, completion: @escaping ([Country]?, Error?) -> Void) {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        Alamofire.request(urlRequest).responseData { data in
            if data.error == nil {
                do {
                    let decoder = JSONDecoder()
                    let country = try decoder.decode([Country].self, from: data.data!)
                    completion(country, nil)
                } catch {
                    completion([], error)
                }
            } else {
                completion([], nil)
            }
        }.validate()
    }
}

