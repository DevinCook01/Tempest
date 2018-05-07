//
//  GeocodingData.swift
//  Tempest
//
//  Created by Devan Allara on 5/2/18.
//  Copyright © 2018 Devan Allara. All rights reserved.
//

import Foundation
import SwiftyJSON


class GeocodingData {
    var latitude: Double
    var longitude: Double
    var name: String
    
    init(json: JSON) {
        print(json)
        self.latitude = json["results"]["geometry"]["location"]["lat"].doubleValue
        self.longitude = json["results"]["geometry"]["location"]["lng"].doubleValue
        self.name = json["results"]["address_components"][2]["long_name"].stringValue
    }
}
