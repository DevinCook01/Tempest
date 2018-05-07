//
//  WeatherData.swift
//  Tempest
//
//  Created by Devan Allara on 5/1/18.
//  Copyright © 2018 Devan Allara. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class WeatherData {
    var weatherEmoji: String
    var currentTemp: Double
    var highTemp: Double
    var lowTemp: Double
    
    //clear-day, clear-night, rain, snow, sleet, wind, fog, cloudy, partly cloudy-day, or partly-cloudy-night
    

    init(json: JSON) {
        self.currentTemp = json["currently"]["temperature"].doubleValue
        self.highTemp = json["daily"]["data"][0]["temperatureHigh"].doubleValue
        self.lowTemp = json["daily"]["data"][0]["temperatureLow"].doubleValue
        var weatherIcon = json["currently"]["icon"].stringValue
        switch weatherIcon {
        case "clear-day":
           self.weatherEmoji = "☀️"
        case "clear-night":
            self.weatherEmoji = "🌕"
        case "rain":
            self.weatherEmoji = "🌧"
        case "snow":
            self.weatherEmoji = "☃️"
        case "sleet":
            self.weatherEmoji = "🌨"
        case "wind":
            self.weatherEmoji = "🌬"
        case "fog":
            self.weatherEmoji = "🌫"
        case "cloudy":
            self.weatherEmoji = "☁️"
        case "partly-cloudy-day":
            self.weatherEmoji = "⛅️"
        case "partly-cloudy-night":
            self.weatherEmoji = "☁️"
        default:
            self.weatherEmoji = "🆘"
        }
    }
}
