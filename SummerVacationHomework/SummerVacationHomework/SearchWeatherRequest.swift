//
//  SearchWeatherRequest.swift
//  SummerVacationHomework
//
//  Created by KaitoKudou on 2019/08/20.
//  Copyright © 2019 KaitoKudou. All rights reserved.
//

import Foundation
import APIKit

final class WeatherApi{
    private init() {}
    
    struct SearchWeather: WetherRequest{
        typealias Response = WetherData
        let query: String
        
        var method: HTTPMethod{
            return .get
        }
        var path: String{
            return "/v1"
        }
        /*var parameters: Any?{
            //return "?city=\(query)"
            return ["city" : query]
        }*/
        
        var queryParameters: [String : Any]?{
            return ["city" : query]
        }
    }
}
