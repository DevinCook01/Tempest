//
//  HomeScreenViewController.swift
//  Tempest
//
//  Created by Devan Allara on 5/1/18.
//  Copyright © 2018 Devan Allara. All rights reserved.
//


import UIKit


class HomeScreenViewController: UIViewController {
    @IBOutlet weak var locationNameLabel: UILabel!
    
    @IBOutlet weak var weatherEmoji: UILabel!
    
    @IBOutlet weak var currentTemp: UILabel!
    
    @IBOutlet weak var highTemp: UILabel!
    
    @IBOutlet weak var lowTemp: UILabel!
    
    var apiManager = ApiManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apiManager.getWeather(latitude: 38.256, longitude: -85.753, onSuccess: { (weatherData) in
            self.currentTemp.text = String(weatherData.currentTemp)
            self.weatherEmoji.text = weatherData.weatherEmoji
            self.highTemp.text = String(weatherData.highTemp)
            self.lowTemp.text = String(weatherData.lowTemp)
        }) { (error) in
            print(error)
        }
        
    }
}
