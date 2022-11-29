//
//  APISession.swift
//  weather
//
//  Created by Vitaliy Plaschenkov on 29.11.2022.
//

import UIKit

extension ViewController{
    
    func updateWeatherInfo(latitude: Double, longtitude: Double){
        let session = URLSession.shared
        guard let url = URL(string:
        "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude.description)&lon=\(longtitude.description)&appid=238fa42ca3504d5f98288aa7c49ab936&units=metric") else {
            return
        }
        
        let tast = session.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                print (error!.localizedDescription)
                return
            }
            guard let data = data else {
                return
            }
            do {
                self.weatherData = try JSONDecoder().decode(WeatherData.self, from: data)
                DispatchQueue.main.async {
                    self.updateView()
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        tast.resume()
        }
    
    func searchWeatherInfo(cityName: String){
        let session = URLSession.shared
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityName.replacingOccurrences(of: " ", with: "%20"))&appid=238fa42ca3504d5f98288aa7c49ab936&units=metric") else {
            return
        }
            let task = session.dataTask(with: url) { data, response, error in
                guard error == nil else {
                    print(error!.localizedDescription)
                    return
                }
                guard let data = data else {
                    return
                }
                do {
                self.weatherData = try JSONDecoder().decode(WeatherData.self, from: data)
                    DispatchQueue.main.async {
                        self.updateView()
                    }
                } catch {
                    print (error.localizedDescription)
                }
            }
        task.resume()
    }
}
