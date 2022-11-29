//
//  DataModel.swift
//  weather
//
//  Created by Vitaliy Plaschenkov on 27.11.2022.
//

import Foundation

struct Weather: Codable {
    var id: Int = 0
    var main: String = ""
    var description: String = ""
    var icon: String = ""
}

struct Main: Codable {
    var temp: Double = 0.0
    var feels_like: Double = 0.0
    var pressure: Int = 0
    var humidity: Int = 0
}

struct WeatherData: Codable  {
    var weather: [Weather] = []
    var main = Main()
    var name: String = ""
}
