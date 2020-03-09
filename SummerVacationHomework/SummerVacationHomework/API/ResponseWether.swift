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
    
    /*init(dataLabel:String, telop:String, data:String, temperature:Temperature, image:Image) {
        self.dateLabel = dataLabel
        self.telop = telop
        self.date = data
        self.temperature = temperature
        self.image = image
        
    }*/
    
    
}

struct Temperature: Codable{
    var max: Max?
    var min: Min?
}

struct Image: Codable{
    var url: URL
    var title: String
    
    /*init(url:URL, title:String) {
        self.url = url
        self.title = title
    }*/
}

struct Max: Codable {
    var celsius: String // 最高気温
    
    /*init(celsius:String) {
        self.celsius = celsius
    }*/
}

struct Min: Codable {
    var celsius: String // 最低気温
    
    /*init(celsius:String) {
        self.celsius = celsius
    }*/
}

struct Location: Codable {
    var city: String // 市町村
    var prefecture: String // 都道府県
    
    /*init(city:String, prefecture:String) {
        self.city = city
        self.prefecture = prefecture
    }*/
}

struct WetherData: Codable {
    var forecasts: [Forecasts]
    var location: Location
    
    /*init(forecasts:[Forecasts], location:Location)
    {
        self.forecasts = forecasts
        self.location = location
    }*/
}
