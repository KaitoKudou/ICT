//
//  CustomCell.swift
//  SummerVacationHomework
//
//  Created by 工藤海斗 on 2020/03/11.
//  Copyright © 2020 KaitoKudou. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var telopLabel: UILabel!
    @IBOutlet weak var wetherImage: UIImageView!
    @IBOutlet weak var maxCelsius: UILabel!
    @IBOutlet weak var minCelsius: UILabel!
    
    var viewController : ViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
}
