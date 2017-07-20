//
//  Constants.swift
//  weathercloud
//
//  Created by Amith Kumar Aellanki on 6/29/17.
//  Copyright © 2017 Amith Kumar Aellanki. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"

let LATITUDE = "lat="
let LONGITUDE = "&lon="
let API_ID = "&appid="
let API_KEY = "dc6e0d2c59f067202928c8038a3d5094"

typealias DownloadComplete = ( ) -> ( )

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)19\(LONGITUDE)13\(API_ID)\(API_KEY)"
let FORECAST_URL = "https://samples.openweathermap.org/data/2.5/forecast/daily?lat=35&lon=139&cnt=10&appid=b1b15e88fa797225412429c1c50c122a1"

