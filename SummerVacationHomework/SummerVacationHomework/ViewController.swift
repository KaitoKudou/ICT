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
    
    var forecasts: [Forecasts] = []
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
            
            //print(self?.forecasts as Any) // ここでは情報が入っている
            
        }
        //print(self.forecasts) // ここで中身が空っぽになる。なぜ？？？
        //print(self.location as Any) // ここで中身が空っぽになる。なぜ？？？
        
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(self.forecasts.count) // ０になる。　うーん
        return self.forecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "wetherCell", for: indexPath)
        cell.textLabel?.text = forecasts[indexPath.row].date
        
        return cell
    }


}

