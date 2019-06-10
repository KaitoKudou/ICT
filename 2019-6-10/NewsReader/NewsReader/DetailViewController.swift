//
//  DetailViewController.swift
//  NewsReader
//
//  Created by KaitoKudou on 2019/06/10.
//  Copyright © 2019 KaitoKudou. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController : UIViewController{
    
    @IBOutlet weak var webView: WKWebView!
    
    var link:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: self.link){ // linkを引数URLクラスのurlインスタンスを生成
            let request = URLRequest(url: url) // urlインスタンスを引数にして、URLRequestクラスのrequestインスタンスを作成する
            self.webView.load(request) // requestインスタンスを引数にして、webViewブロバティのloadU)メソッドを実行する
        }
        
    }
    
}

