//
//  SearchViewController.swift
//  i-weather
//
//  Created by Rahul Pahuja on 16/05/21.
//

import UIKit

class SearchViewController:UIViewController,UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    
    //This can be improved with a closure
    static var weather:Welcome?
    
    @IBOutlet weak var sunImageView: UIImageView!
    @IBOutlet weak var temperatureUnitLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var detailsTableView: UITableView!
    let properties = ["Current Temperature","Min Temperature","Max Temperature","Pressure","Humidity"]
    let BASE:Double = 273
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =
            detailsTableView.dequeueReusableCell(withIdentifier: "dataViewCell", for:indexPath)
            
            as! WeatherDataTableViewCell
            
        
        cell.property.text = properties[indexPath.row]
        if SearchViewController.weather != nil{
            cityNameLabel.text = SearchViewController.weather?.name
            
            let value = SearchViewController.weather?.main.temp
            temperatureLabel.text = "\(Float(value!  - BASE))°c"
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
        detailsTableView.delegate = self
        detailsTableView.dataSource = self
        shouldHideControls(value: true)
        
        
    }
    
    
    //Number of Sections in Row
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    //Gets called when the search bar text is edited and stopeed
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        let cityName = searchBar.text?.lowercased()
        let path = getURL(city: cityName!)
        //print(path)
        //Call API here
        WeatherFetcher.getWeather(path: path)
        detailsTableView.reloadData()
        shouldHideControls(value: false)
    }
    //Gets Called when the Editing of the Text in the Search bar begins
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        let cityName = searchBar.text?.lowercased()
        let path = getURL(city: cityName!)
        //print(path)
        WeatherFetcher.getWeather(path: path)
        detailsTableView.reloadData()
        shouldHideControls(value: false)
    }
    
    //Gets Called when the Search Button of the is clicked
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let cityName = searchBar.text?.lowercased()
        let path = getURL(city: cityName!)
        //print(path)
        WeatherFetcher.getWeather(path: path)
        detailsTableView.reloadData()
        shouldHideControls(value: false)
    }
    
    func shouldHideControls(value:Bool){
        cityNameLabel.isHidden = value
        temperatureLabel.isHidden = value
        detailsTableView.isHidden = value
        sunImageView.isHidden = value
    }
    
    
}
