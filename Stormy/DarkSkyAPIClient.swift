//
//  DarkSkyAPIClient.swift
//  Stormy
//
//  Created by hardik Pans on 6/14/18.
//  Copyright © 2018 hardik. All rights reserved.
//

import Foundation

class DarkSkyAPIClient {
    fileprivate let apiKey = "bd3ac778a93f13af11fd4fda65c4286e"
    
    lazy var baseUrl: URL = {
        return URL(string: "https://api.darksky.net/forecast/\(self.apiKey)/")!
        }()
    
    let downloader = JSONDownloader()
    
    typealias currentWeatherCompletionHandler = (CurrentWeather?, DarkSkyError?) -> Void
    func getCurrentWeather(at coordinate: Coordinate, completionHandler completion: @escaping currentWeatherCompletionHandler ) {
        
        guard let url = URL(string: coordinate.description, relativeTo: baseUrl) else {
            completion(nil, .invalidURL)
            return
        }
        let request = URLRequest(url: url)
        
        let task = downloader.jsonTask(with: request) { json, error in
            
            DispatchQueue.main.async {
                guard let json = json else {
                    completion(nil, error)
                    return
                }
                
                guard let currentWeatherJson = json["currently"] as? [String: AnyObject], let currentWeather = CurrentWeather(json: currentWeatherJson) else {
                    completion(nil, .jsonParsingFailure)
                    return
                }
                
                completion(currentWeather, nil)

            }
            
        }
        task.resume()
        
    }
}
