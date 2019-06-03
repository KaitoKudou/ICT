//
//  ViewController.swift
//  SNS
//
//  Created by KaitoKudou on 2019/05/27.
//  Copyright © 2019 KaitoKudou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBAction func showActivityView(_ sender: UIBarButtonItem) {
        guard let image = imageView.image else { return }
        func showMessage(){
            print("表示完了");
        }
        let controller = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        self.present(controller, animated: true, completion: showMessage)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.image = UIImage(named: "Image")
        
    }


}

