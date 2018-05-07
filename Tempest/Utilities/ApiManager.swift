//
//  ApiManager.swift
//  Tempest
//
//  Created by Devan Allara on 4/30/18.
//  Copyright © 2018 Devan Allara. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class ApiManager {
    
    
    var apiKeys = ApiKeys()
    
    private let darkSkyBaseURL = "https://api.darksky.net/forecast/"
    private let googleBaseURL = "https://maps.googleapis.com/maps/api/geocode/json?address="
    
    func getWeather(latitude: Double, longitude: Double, onSuccess: @escaping (WeatherData) -> Void, onError: @escaping (Error) -> Void) {
        
        let url = URL(string: "\(darkSkyBaseURL)\(apiKeys.darkSkyKey)/\(latitude),\(longitude)")
        
        var request = Alamofire.request(url!, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
        
        request.responseJSON { (response) in
            print(response.value)
            let json = JSON(response.value)
            let weather = WeatherData(json: json)
            onSuccess(weather)
        }
    }
    
    func getLocation(location: String, onSuccess: @escaping (GeocodingData) -> Void, onError: @escaping (Error) -> Void) {
        let url = URL(string: "\(googleBaseURL)\(location)&key=\(apiKeys.googleApiKey)")
        
        let request = Alamofire.request(url!)
        
        request.responseJSON { (response) in
            let json = JSON(response.value)
            let location = GeocodingData(json: json)
            onSuccess(location)
        }
    }
}
