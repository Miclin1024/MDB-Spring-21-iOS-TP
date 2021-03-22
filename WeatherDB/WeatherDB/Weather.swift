//
//  Weather.swift
//  WeatherDB
//
//  Created by Michael Lin on 3/21/21.
//

import Foundation

/**
 * A collection of weather infomation at a given location.
 */
struct Weather: Codable {
    
    struct Main: Codable {
        
        /**
         * Temperature. Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit.
         */
        let temperature: Double
        
        /**
         * The feels like temperature. This temperature parameter accounts for the human perception of weather.
         * Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit.
         */
        let heatIndex: Double
        
        /**
         * Minimum temperature at the moment. This is minimal currently observed temperature (within large megalopolises and urban areas).
         * Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit.
         */
        let minTemperature: Double
        
        /**
         * Maximum temperature at the moment. This is maximal currently observed temperature (within large megalopolises and urban areas).
         * Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit.
         */
        let maxTemperature: Double
        
        /**
         * Atmospheric pressure (on the sea level), hPa
         */
        let pressure: Int
        
        /**
         * Humidity, %
         */
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
        /**
         * Weather condition id.
         */
        let id: Int
        
        /**
         * Group of weather parameters (Rain, Snow, Extreme etc.)
         */
        let name: String
        
        /**
         * Weather condition within the group.
         */
        let description: String
        
        /**
         * Weather icon id.
         */
        let icon: String
        
        enum CodingKeys: String, CodingKey {
            case id
            case name = "main"
            case description
            case icon
        }
    }
        
    /**
     * City name.
     */
    let name: String
    
    /**
     * Shift in seconds from UTC.
     */
    let timezone: Int
    
    /**
     * The main weather data payload.
     */
    let main: Main
    
    /**
     * An array of matching weather conditions at the location.
     */
    let condition: [Condition]
    
    enum CodingKeys: String, CodingKey {
        case name
        case timezone
        case main
        case condition = "weather"
    }
}
