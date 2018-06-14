//
//  ViewController.swift
//  Stormy
//
//  Created by hardik Pans on 6/14/18.
//  Copyright © 2018 hardik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var currentHumidityLabel: UILabel!
    @IBOutlet weak var currentPrecipitationLabel: UILabel!
    @IBOutlet weak var currentWeatherIcon: UIImageView!
    @IBOutlet weak var currentSummaryLabel: UILabel!
    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let client = DarkSkyAPIClient()
    
    //let forecastUrl = URL(string: "https://api.darksky.net/forecast/bd3ac778a93f13af11fd4fda65c4286e/37.8267,-122.4233")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
     /*
        let currentWeather = CurrentWeather(temperature: 85.0, humidity: 0.8, precipitationProbability: 0.1, summary: "HoT!", icon: "clear-day")
        
        let currentWeatherViewModel = CurrentWeatherViewModel(model: currentWeather)
        
        displayWeather(using: currentWeatherViewModel)
        
        let base = URL(string: "https://api.darksky.net/forecast/\(darkSkyApiKey)/")
        guard let forecastUrl = URL(string: "37.8267,-122.4233", relativeTo: base) else { return }
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        let request = URLRequest(url: forecastUrl)
        
        print("Log before request on main thread")
        
        let dataTask = session.dataTask(with: request) { data, response, error in
            print("Log inside completion handler")
        }
        dataTask.resume()
        
        print("Log after resume")
        
     /*   let weatherData = try! Data(contentsOf: forecastUrl!)
        print(weatherData as NSData)
        
        let json = try! JSONSerialization.jsonObject(with: weatherData, options: [])
        print(json) */    // one of the asynchronous approach to fetch data from api
*/
        getCurrentWeather()
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayWeather(using viewModel: CurrentWeatherViewModel) {
        currentTemperatureLabel.text = viewModel.temperature
        currentHumidityLabel.text = viewModel.humidity
        currentPrecipitationLabel.text = viewModel.precipitaationProbablitiy
        currentSummaryLabel.text = viewModel.summary
        currentWeatherIcon.image = viewModel.icon
    }
    
    
    @IBAction func getCurrentWeather() {
        
        ToogleRefreshAnimation(on: true)
        
        let coordinate = Coordinate(latitude: 40.755042, longitude: -73.985810)
        
        client.getCurrentWeather(at: coordinate) { [unowned self] currentWeather, error in
            if let currentWeather = currentWeather {
                let viewModel = CurrentWeatherViewModel(model: currentWeather)
                self.displayWeather(using: viewModel)
                self.ToogleRefreshAnimation(on: false)
            } 
        }
    }
    
    func ToogleRefreshAnimation(on: Bool) {
        refreshButton.isHidden = on
        
        if on {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
    
}
















