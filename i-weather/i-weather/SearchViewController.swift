//
//  SearchViewController.swift
//  i-weather
//
//  Created by Rahul Pahuja on 16/05/21.
//

import UIKit

class SearchViewController:UIViewController,UISearchBarDelegate,UICollectionViewDataSource,UICollectionViewDelegate{
    
    //This can be improved with a closure
    static var weather:Welcome?
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var detailsCollectionView: UICollectionView!
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
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        detailsCollectionView.delegate = self
        detailsCollectionView.dataSource = self
        
        
    }
    
    //Number of Items in a section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    

    //Number of Sections in Row
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    //Gets called when the search bar text is edited and stopeed
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        let cityName = searchBar.text?.lowercased()
        let path = getURL(city: cityName!)
        //print(path)
        //Call API here
        WeatherFetcher.getWeather(path: path)
        detailsCollectionView.reloadData()
    }
    //Gets Called when the Editing of the Text in the Search bar begins
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        let cityName = searchBar.text?.lowercased()
        let path = getURL(city: cityName!)
        //print(path)
        WeatherFetcher.getWeather(path: path)
        detailsCollectionView.reloadData()
    }
    
    //Gets Called when the Search Button of the is clicked
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let cityName = searchBar.text?.lowercased()
        let path = getURL(city: cityName!)
        //print(path)
        WeatherFetcher.getWeather(path: path)
        detailsCollectionView.reloadData()
    }
}
