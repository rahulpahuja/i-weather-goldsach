//
//  Constants.swift
//  i-weather
//
//  Created by Rahul Pahuja on 16/05/21.
//

import Foundation


private let API_KEY_PREFIX = "&appid="
private let API_KEY = "ac650a4ef2dd18bbe68554fb16e846eb"
private let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?q="


public func getURL(city:String)->String{
    return "\(BASE_URL)\(city)\(API_KEY_PREFIX)\(API_KEY)"
}
