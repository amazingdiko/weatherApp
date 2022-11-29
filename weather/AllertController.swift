//
//  alertController.swift
//  weather
//
//  Created by Vitaliy Plaschenkov on 25.11.2022.
//

import UIKit

extension ViewController {

    func presentSearchAllertController(withTitle title: String?, message: String?, style: UIAlertController.Style) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: style)
        ac.addTextField { tf in
            let cities = ["Moscow", "London", "New York", "Istambul", "Paris", "Omsk"]
            tf.placeholder = cities.randomElement()
        }
        let search = UIAlertAction(title: "Search", style: .default) { action in
            let textField = ac.textFields
            guard let cityNames = textField?.first?.text else { return }
            if !cityNames.isEmpty {
                self.searchWeatherInfo(cityName: cityNames)
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        ac.addAction(search)
        ac.addAction(cancel)
        present(ac, animated: true, completion: nil)
    }
    
    func wrongCityNameAllertController(cityName: String){
        let ac = UIAlertController(title: "Warning", message: "Cannot find \(cityName)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(ac, animated: true, completion: nil)
    }
}
