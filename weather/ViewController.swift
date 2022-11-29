//
//  ViewController.swift
//  weather
//
//  Created by Vitaliy Plaschenkov on 23.11.2022.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    let locationManager = CLLocationManager()
    var weatherData = WeatherData()
    
    lazy var backgroundImage: UIImageView = {
        let backgroundImage = UIImageView()
        let imageURL: URL = URL(string: "https://www.gizmochina.com/wp-content/uploads/2022/06/iOS-16-Weather-Wallpaper-2-GIZMOCHINA-Small.jpg")!
        backgroundImage.image = UIImage(data: NSData(contentsOf: imageURL)! as Data)
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        return backgroundImage
    }()
    
    lazy var cloud: UIImageView = {
        let cloud = UIImageView()
        cloud.contentMode = .scaleAspectFill
        cloud.translatesAutoresizingMaskIntoConstraints = false
        return cloud
    }()
    
    lazy var searchButton: UIButton = {
        let searchButton = UIButton()
        searchButton.setImage(UIImage(systemName: "magnifyingglass.circle")?.withTintColor(.white), for: .normal)
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.addTarget(self, action: #selector(searchPressed(sender:)), for: .touchUpInside)
        return searchButton
    }()
    
    @objc func searchPressed(sender: UIButton)
    {
        self.presentSearchAllertController(withTitle: "Enter city name", message: nil, style: .alert)
    }
    
    lazy var temperatureLabel: UILabel = {
       let temperatureLabel = UILabel()
        temperatureLabel.textColor = .white
        temperatureLabel.font = UIFont(name: "Georgia", size: 40)
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        return temperatureLabel
    }()
    
    lazy var feelsLike: UILabel = {
        let feelsLike = UILabel()
        feelsLike.textColor = .white
        feelsLike.font = UIFont(name: "Georgia", size: 15)
        feelsLike.translatesAutoresizingMaskIntoConstraints = false
        return feelsLike
    }()
    
    lazy var cityWeather: UILabel = {
        let cityWeather = UILabel()
        cityWeather.textColor = .white
        cityWeather.font = UIFont(name: "Georgia", size: 40)
        cityWeather.translatesAutoresizingMaskIntoConstraints = false
        return cityWeather
    }()
    
    private func addView(){
        view.addSubview(backgroundImage)
        backgroundImage.addSubview(cloud)
        view.addSubview(searchButton)
        backgroundImage.addSubview(cityWeather)
        backgroundImage.addSubview(temperatureLabel)
        backgroundImage.addSubview(feelsLike)
    }
    
    func updateView(){
        temperatureLabel.text = weatherData.main.temp.description + "°"
        cityWeather.text = weatherData.name
        feelsLike.text = "Feels like " + weatherData.main.feels_like.description + "°"
        if weatherData.main.temp < 0 {
            cloud.image = UIImage(systemName: "cloud.snow.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        }
        else {
            cloud.image = UIImage(systemName: "cloud.fog.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        }
    }
    
    
    private func addConstraints(){
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(backgroundImage.topAnchor.constraint(equalTo: view.topAnchor))
        constraints.append(backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor))
        constraints.append(backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        constraints.append(backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor))

        constraints.append(searchButton.leadingAnchor.constraint(equalTo: cityWeather.trailingAnchor, constant: 5))
        constraints.append(searchButton.centerYAnchor.constraint(equalTo: cityWeather.centerYAnchor))
        
        constraints.append(cityWeather.topAnchor.constraint(equalTo: backgroundImage.topAnchor, constant: 40))
        constraints.append(cityWeather.centerXAnchor.constraint(equalTo: backgroundImage.centerXAnchor))
        
        constraints.append(cloud.heightAnchor.constraint(equalToConstant: 150))
        constraints.append(cloud.widthAnchor.constraint(equalToConstant: 150))
        
        constraints.append(cloud.centerXAnchor.constraint(equalTo: backgroundImage.centerXAnchor))
        constraints.append(cloud.topAnchor.constraint(equalTo: cityWeather.bottomAnchor, constant: 5))
        
        constraints.append(temperatureLabel.topAnchor.constraint(equalTo: cloud.bottomAnchor, constant: 5))
        constraints.append(temperatureLabel.centerXAnchor.constraint(equalTo: backgroundImage.centerXAnchor))
        
        constraints.append(feelsLike.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor))
        constraints.append(feelsLike.centerXAnchor.constraint(equalTo: backgroundImage.centerXAnchor))
        
        NSLayoutConstraint.activate(constraints)
    }
    

    override func viewDidLoad() {
        startLocationManager()
        addView()
        addConstraints()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


