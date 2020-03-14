//
//  ResponseWether.swift
//  SummerVacationHomework
//
//  Created by KaitoKudou on 2019/08/13.
//  Copyright © 2019 KaitoKudou. All rights reserved.
//

import Foundation

struct Forecasts: Codable{
    var dateLabel: String // "今日"　or "明日"　or "明後日"
    var telop: String // 天気
    var date: String // 日付
    
    var temperature: Temperature // 気温
    var image: Image // 天気の画像
}

struct Temperature: Codable{
    var max: Max?
    var min: Min?
}

struct Image: Codable{
    var url: URL
    var title: String
}

struct Max: Codable {
    var celsius: String // 最高気温
}

struct Min: Codable {
    var celsius: String // 最低気温
}

struct Location: Codable {
    var city: String // 市町村
    var prefecture: String // 都道府県
}

struct WetherData: Codable {
    var forecasts: [Forecasts]
    var location: Location
}
