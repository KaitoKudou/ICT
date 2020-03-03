//
//  ViewController.swift
//  SummerVacationHomework
//
//  Created by KaitoKudou on 2019/08/12.
//  Copyright © 2019 KaitoKudou. All rights reserved.
//

import UIKit
import APIKit

class ViewController: UIViewController {
    
    //let result
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Session.send(WeatherApi.SearchWeather(query: "017010")){ result in
            switch result{
            case .success(let response):
                print(response)
                
            case .failure(let error):
                print(error)
            }
        
        }
    }


}

