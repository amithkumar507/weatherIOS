//
//  weatherVC.swift
//  weathercloud
//
//  Created by Amith Kumar Aellanki on 6/29/17.
//  Copyright © 2017 Amith Kumar Aellanki. All rights reserved.
//

import UIKit
import Alamofire

class weatherVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var datelabel: UILabel!
    
    @IBOutlet weak var templabel: UILabel!
    
    @IBOutlet weak var citylabel: UILabel!
    
    @IBOutlet weak var weatherimagelabel: UIImageView!
    
    @IBOutlet weak var weatherlabel: UILabel!
    
    @IBOutlet weak var tableview: UITableView!
    
    var forecast: Forecast!
    var currentWeather: CurrentWeather!
    var forecasts = [Forecast]( )
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableview.delegate = self
        tableview.dataSource  = self
        
        currentWeather = CurrentWeather( )
        //forecast = Forecast( )
        currentWeather.downloadWeatherDetails {
            self.downloadForecastData {
                self.updateMainUI( )
                
            }
            
        }
        
    }
    
    func downloadForecastData(completed: @escaping DownloadComplete) {
        
        let forecastURL = URL(string: FORECAST_URL)
        Alamofire.request(forecastURL!).responseJSON { response in
            
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
                    
                    for obj in list {
                        let forecast = Forecast(weatherDict: obj)
                        self.forecasts.append(forecast)
                        print(obj)  
                    }
                }
            }
            
            completed( )
        }
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        
        return cell
    }
    
    func updateMainUI( ) {
        
        datelabel.text = currentWeather.date
        templabel.text = "\(currentWeather.currentTemp)"
        weatherlabel.text = currentWeather.weatherType
        citylabel.text = currentWeather.cityName
        weatherimagelabel.image = UIImage(named: currentWeather.weatherType)
     
        
    }
}
