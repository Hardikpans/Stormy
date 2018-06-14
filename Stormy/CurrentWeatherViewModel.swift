//
//  CurrentWeatherViewModel.swift
//  Stormy
//
//  Created by hardik Pans on 6/13/18.
//  Copyright © 2018 hardik. All rights reserved.
//

import Foundation
import UIKit

struct CurrentWeatherViewModel {
    let temperature: String
    let humidity: String
    let precipitaationProbablitiy: String
    let summary: String
    let icon: UIImage
    
    init(model: CurrentWeather) {
        let roundedTemperature = Int(model.temperature)
        self.temperature = "\(roundedTemperature)º"
        let humidityPercent = Int(model.humidity * 100)
        self.humidity = "\(humidityPercent)%"
        let percipPercent = Int(model.precipitationProbability * 100)
        self.precipitaationProbablitiy = "\(percipPercent)%"
        self.summary = model.summary
        
        let weatherIcon = WeatherIcon(iconString: model.icon)
        self.icon = weatherIcon.image
    }
    
}
