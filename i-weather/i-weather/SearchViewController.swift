//
//  SearchViewController.swift
//  i-weather
//
//  Created by Rahul Pahuja on 16/05/21.
//

import UIKit

class SearchViewController:UIViewController,UISearchBarDelegate{
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        let cityName = searchBar.text?.lowercased()
        let path = getURL(city: cityName!)
        print(path)
        WeatherFetcher.getWeather(path: path)
        //Call API here
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let cityName = searchBar.text?.lowercased()
        let path = getURL(city: cityName!)
        print(path)
        WeatherFetcher.getWeather(path: path)
    }
}
