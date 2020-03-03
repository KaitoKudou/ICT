//
//  ResponseWether.swift
//  SummerVacationHomework
//
//  Created by KaitoKudou on 2019/08/13.
//  Copyright © 2019 KaitoKudou. All rights reserved.
//

import Foundation

struct Forecasts: Codable{
    var dateLabel: String? // "今日"　or "明日"　or "明後日"
    var telop: String? // 天気
    var date: String?
    //var celsius: Int? // 最高気温
    var temperature: Temperature
}

struct Temperature: Codable{
    var max: Max?
}

struct Max: Codable {
    var celsius: String? // 最高気温
}

struct Location: Codable {
    var city: String // 市町村
    var prefecture: String // 都道府県
}

struct WetherData: Codable {
    var forecasts: [Forecasts]
    var location: Location
}
/*struct WetherData: Codable{
    var forecasts: [Forecasts]
    var location: Location
    
    struct  Forecasts: Codable{
        var dateLabel: String // "今日"　or "明日"　or "明後日"
        var telop: String // 天気
        var temperature: Temperature
        
        struct Temperature: Codable{
            var max: Max
            
            struct Max: Codable {
                var celsius: Int // 最高気温
            }
        }
        
    }
    
    struct Location: Codable {
        var city: String // 市町村
        var prefecture: String // 都道府県
    }
}*/

