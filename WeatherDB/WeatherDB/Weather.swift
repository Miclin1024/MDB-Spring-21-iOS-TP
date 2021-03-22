//
//  Weather.swift
//  WeatherDB
//
//  Created by Michael Lin on 3/21/21.
//

import Foundation

struct Weather: Codable {
    
    struct Main: Codable {
        let temperature: Double
        let heatIndex: Double
        let minTemperature: Double
        let maxTemperature: Double
        let pressure: Int
        let humidity: Int
        
        enum CodingKeys: String, CodingKey {
            case temperature = "temp"
            case heatIndex = "feels_like"
            case minTemperature = "temp_min"
            case maxTemperature = "temp_max"
            case pressure
            case humidity
        }
    }
    
    struct Condition: Codable {
        let id: Int
        let name: String
        let description: String
        let icon: String
        
        enum CodingKeys: String, CodingKey {
            case id
            case name = "main"
            case description
            case icon
        }
    }
    
    let name: String
    
    let timezone: Int
    
    let main: Main
    
    let condition: [Condition]
    
    enum CodingKeys: String, CodingKey {
        case name
        case timezone
        case main
        case condition = "weather"
    }
}
