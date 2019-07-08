//
//  ViewController.swift
//  apiPractice
//
//  Created by KaitoKudou on 2019/07/01.
//  Copyright © 2019 KaitoKudou. All rights reserved.
//

import UIKit

struct Article: Codable {
    var name: String
    var owner: Owner
    
    struct Owner: Codable {
        var login: String
        var avatar_url: String
    }
    
}

struct git {
    
    static func fetchArticle(completion: @escaping ([Article]) -> ()) {
        
        let url = "https://api.github.com/repositories"
        
        // リクエスト？
        guard let urlComponents = URLComponents(string: url) else {
            return
        }
        
//        urlComponents.queryItems = [
//            URLQueryItem(name: "per_page", value: "50"),
//        ]
        
        // 通信
        let task = URLSession.shared.dataTask(with: urlComponents.url!) { data, response, error in
            
            guard let jsonData = data else {
                return
            }
            do {
                let articles = try JSONDecoder().decode([Article].self, from: jsonData)
                completion(articles)
                debugPrint(articles)
                
            } catch {
                //print("ohohohojohjo")
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}


class ViewController: UIViewController {
    
    private var tableView = UITableView()
    fileprivate var articles: [Article] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //title = "最新記事"
        
        setUpTableView: do {
            tableView.frame = view.frame
            tableView.dataSource = self
            view.addSubview(tableView)
        }
        
        git.fetchArticle(completion: { (articles) in
            self.articles = articles
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let article = articles[indexPath.row]
        cell.textLabel?.text = article.name
        cell.detailTextLabel?.text = article.owner.login
        //cell.imageView?.image = UIImage(named: )
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
}

