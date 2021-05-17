//
//  SearchViewController.swift
//  i-weather
//
//  Created by Rahul Pahuja on 16/05/21.
//

import UIKit

class SearchViewController:UIViewController,UISearchBarDelegate,UICollectionViewDataSource,UICollectionViewDelegate{
    
    static var weather:Welcome?
    
    let properties = ["Current","Min","Max","Pressure","Humidity"]
    let BASE = 273
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = detailsCollectionView.dequeueReusableCell(withReuseIdentifier: "dataViewCell", for: indexPath)
            as! WeatherDataCollectionViewCell
        
        cell.property.text = properties[indexPath.row]
        if SearchViewController.weather != nil{
            switch indexPath.row{
            case 0:
                cell.value.text = String((SearchViewController.weather?.main.temp)!)
                break
            case 1:
                cell.value.text = String((SearchViewController.weather?.main.tempMin)!)
                break
            case 2:
                cell.value.text = String((SearchViewController.weather?.main.tempMax)!)
                break
            case 3:
                cell.value.text = String((SearchViewController.weather?.main.pressure)!)
                break
            case 4:
                cell.value.text = String((SearchViewController.weather?.main.humidity)!)
                break
            default:
                
                break
            }
            
        }
        //cell.value.text =
        return cell
    }
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var detailsCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        detailsCollectionView.delegate = self
        detailsCollectionView.dataSource = self
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    

    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    
    
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        let cityName = searchBar.text?.lowercased()
        let path = getURL(city: cityName!)
        print(path)
        WeatherFetcher.getWeather(path: path)
        //Call API here
        detailsCollectionView.reloadData()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        let cityName = searchBar.text?.lowercased()
        let path = getURL(city: cityName!)
        print(path)
        WeatherFetcher.getWeather(path: path)
        detailsCollectionView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let cityName = searchBar.text?.lowercased()
        let path = getURL(city: cityName!)
        print(path)
        WeatherFetcher.getWeather(path: path)
        detailsCollectionView.reloadData()
    }
}
