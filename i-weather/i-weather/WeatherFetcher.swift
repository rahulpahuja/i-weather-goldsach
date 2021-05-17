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
        AF.request(path).responseJSON { (data) in
            do{
                let welcome = try? JSONDecoder().decode(Welcome.self, from: data.data!)
                print(welcome)
                SearchViewController.weather = welcome
            }catch let error{
                print(error.localizedDescription)
            }
            
            
            print(data.data!)
        }
    }
}
