//
//  ViewController.swift
//  SummerVacationHomework
//
//  Created by KaitoKudou on 2019/08/12.
//  Copyright © 2019 KaitoKudou. All rights reserved.
//

import UIKit
import APIKit

class ViewController: UIViewController, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    public var forecasts: [Forecasts] = []
    var location: Location!
    var x : Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Session.send(WeatherApi.SearchWeather(query: "017010")){ [weak self] result in
            switch result{
            case .success(let response):
                self?.forecasts = response.forecasts
                self?.location = response.location
                print(self?.forecasts as Any) // ここでは情報が入っている
                print(response.location) // ここでは情報が入っている
                
                
                self?.tableView.reloadData()
                
            case .failure(let error):
                print(error)
            }
        }
        
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CustomCell", bundle: nil),forCellReuseIdentifier:"customCell")
        tableView.register(UINib(nibName: "TomorrowCustomCell", bundle: nil), forCellReuseIdentifier:"tomorrowCustomCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(self.forecasts.count)
        return self.forecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomCell
             cell.setCell(cityName: location.city, date: forecasts[indexPath.row].date, telop: forecasts[indexPath.row].telop, wetherImageURL: forecasts[indexPath.row].image.url, max: forecasts[indexPath.row].temperature.max?.celsius, min: forecasts[indexPath.row].temperature.min?.celsius)
            
             return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "tomorrowCustomCell", for: indexPath) as! TomorrowCustomCell
            cell.setTomorrowCell(date: forecasts[indexPath.row].date, telop: forecasts[indexPath.row].telop, wetherImageURL: forecasts[indexPath.row].image.url, max: forecasts[indexPath.row].temperature.max?.celsius, min: forecasts[indexPath.row].temperature.min?.celsius)
            
             return cell
        }
        
    }


}

