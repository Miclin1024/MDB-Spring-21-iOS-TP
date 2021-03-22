//
//  WeatherRequest.swift
//  WeatherDB
//
//  Created by Michael Lin on 3/21/21.
//

import Foundation
import CoreLocation

class WeatherRequest {
    
    enum Unit: String {
        case standard, metric, imperial
    }
    
    enum RequestError: Error {
        case JSONDecodeFail
    }
    
    static let shared = WeatherRequest()
    
    let currWeatherURL = URL(string: "https://api.openweathermap.org/data/2.5/weather")!
    
    /**
     * The OpenWeather API key. Must be filled out in Secret.plist.
     */
    let key: String = {
        let url = Bundle.main.url(forResource: "Secret", withExtension: "plist")
        let dictionary = NSDictionary(contentsOf: url!)
        guard let val = dictionary?["API Key"] as? String else {
            fatalError("Missing API key in Secret.plist")
        }
        return val
    }()
    
    /**
     * Units of measurement.
     */
    var unit: Unit = .imperial
    
    /**
     * Request the one-time delivery of weather data for the city.
     */
    func weather(for city: String, state: String? = nil, country: String? = nil,
                 completion: ((Result<Weather, RequestError>)->Void)? = nil) {
        var urlComponents = URLComponents(url: currWeatherURL, resolvingAgainstBaseURL: true)!
        
        let queryDictionary: [String: String] = [
            "q": [city, state, country].compactMap{ $0 }.joined(separator: ", "),
            "appid": key,
            "units": unit.rawValue
        ]
        urlComponents.queryItems = queryDictionary.map {
            URLQueryItem(name: $0, value: $1)
        }
        guard let url = urlComponents.url else {
            print("Cannot create URL")
            return
        }
        
        sendRequest(url: url, completion: completion)
    }
    
    /**
     * Request the one-time delivery of weather data for the location.
     */
    func weather(at location: CLLocation,
                 completion: ((Result<Weather, RequestError>)->Void)? = nil) {
        var urlComponents = URLComponents(url: currWeatherURL, resolvingAgainstBaseURL: true)!
        
        let queryDictionary: [String: String] = [
            "lat": String(location.coordinate.latitude),
            "lon": String(location.coordinate.longitude),
            "appid": key,
            "units": unit.rawValue
        ]
        urlComponents.queryItems = queryDictionary.map {
            URLQueryItem(name: $0, value: $1)
        }
        guard let url = urlComponents.url else {
            print("Cannot create URL")
            return
        }
        
        sendRequest(url: url, completion: completion)
    }
    
    private func sendRequest(url: URL, completion: ((Result<Weather, RequestError>)->Void)?) {
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let response = response as? HTTPURLResponse,
                  response.statusCode == 200, let data = data, error == nil else {
                // TODO: Error Handling
                return
            }
            let decoder = JSONDecoder()
            do {
                let weather = try decoder.decode(Weather.self, from: data)
                completion?(.success(weather))
            } catch {
                print("Error decoding JSON: \(error)")
                completion?(.failure(.JSONDecodeFail))
            }
        }
        
        dataTask.resume()
    }
}
