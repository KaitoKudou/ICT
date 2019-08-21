//
//  RequestWether.swift
//  SummerVacationHomework
//
//  Created by KaitoKudou on 2019/08/13.
//  Copyright © 2019 KaitoKudou. All rights reserved.
//

import Foundation
import APIKit

// APIKitがも持っているRequestに批准したWetherProtcolを作成
protocol WetherRequest: Request {}

extension WetherRequest {
    var baseURL: URL {
        // v1がpathになる
        return URL(string: "http://weather.livedoor.com/forecast/webservice/json")!
    }
    
}

extension WetherRequest where Response: Decodable {
    var dataParser: DataParser {
        return JSONDataParser()
    }
    
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        guard let data = object as? Data else {
            throw ResponseError.unexpectedObject(object)
        }
        return try JSONDecoder().decode(Response.self, from: data)
    }
}


