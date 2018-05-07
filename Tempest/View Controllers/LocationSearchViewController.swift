//
//  LocationSearchViewController.swift
//  Tempest
//
//  Created by Devan Allara on 5/3/18.
//  Copyright © 2018 Devan Allara. All rights reserved.
//

import UIKit

class LocationSearchViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var apiManager = ApiManager()
    var locationData: GeocodingData?
    
    override func viewDidLoad() {
         super.viewDidLoad()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let location = searchBar.text?.replacingOccurrences(of: " ", with: "+")
        apiManager.getLocation(location: location!, onSuccess: { (geocodingData) in
            self.locationData = geocodingData
            print(self.locationData?.latitude)
            print(self.locationData?.longitude)
            
        }) { (error) in
            print(error)
        }
    }
}
