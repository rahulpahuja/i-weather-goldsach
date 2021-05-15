//
//  WeatherFetcher.swift
//  i-weather
//
//  Created by Rahul Pahuja on 16/05/21.
//

import Foundation
import Alamofire

class WeatherFetcher{
    public static func getWeather(path:String){
        let url = URL(fileURLWithPath: path)
        AF.request(url).responseJSON { (data) in
            print(data.data)
        }
    }
}
