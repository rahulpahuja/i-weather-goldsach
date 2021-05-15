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
        var cityName = searchBar.text?.lowercased()
        print(getURL(city: cityName!))
        //Call API here
    }
}
