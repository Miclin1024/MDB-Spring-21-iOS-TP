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
    
    let key: String = {
        let url = Bundle.main.url(forResource: "Secret", withExtension: "plist")
        let dictionary = NSDictionary(contentsOf: url!)
        guard let val = dictionary?["API Key"] as? String else {
            fatalError("Missing API key in Secret.plist")
        }
        return val
    }()
    
    var unit: Unit = .imperial
    
    func weather(for city: String, state: String? = nil, country: String? = nil,
                 completion: ((Result<Weather, RequestError>)->Void)? = nil) {
        var urlComponents = URLComponents(url: currWeatherURL, resolvingAgainstBaseURL: true)!
        
        let queryDictionary = [
            "q": [city, state, country].compactMap{ $0 }.joined(separator: ", "),
            "appid": key,
            "units": unit.rawValue
        ]
        urlComponents.queryItems = queryDictionary.map {
            URLQueryItem(name: $0, value: $1)
        }
        guard let url = urlComponents.url else {
            print("Unable to create URL")
            return
        }
        
        sendRequest(url: url, completion: completion)
    }
    
    func weather(at location: CLLocation,
                 completion: ((Result<Weather, RequestError>)->Void)? = nil) {
        
    }
    
    func sendRequest(url: URL, completion: ((Result<Weather, RequestError>)->Void)?) {
        print(url)
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
