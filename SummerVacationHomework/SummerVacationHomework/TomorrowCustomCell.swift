//
//  TomorrowCustomCell.swift
//  SummerVacationHomework
//
//  Created by 工藤海斗 on 2020/03/15.
//  Copyright © 2020 KaitoKudou. All rights reserved.
//

import UIKit

class TomorrowCustomCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var telopLabel: UILabel!
    
    @IBOutlet weak var wetherImage: UIImageView!
    
    @IBOutlet weak var maxCelsiusLabel: UILabel!
    
    @IBOutlet weak var minCelsiusLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setTomorrowCell(date:String, telop:String, wetherImageURL:URL, max:String?, min:String?){
        
        dateLabel.text = date
        telopLabel.text = telop
        
        guard let imageData = try? Data(contentsOf: wetherImageURL) else {
            return
        }
        wetherImage.image = UIImage(data: imageData)
        
        if let maxCelsius:String = max{
            maxCelsiusLabel.text = "最高気温：\(maxCelsius)°C"
        }
        else{
            maxCelsiusLabel.text = "最高気温：nil"
        }
        
        
        if let minCelsius:String = min{
            minCelsiusLabel.text = "最低気温：\(minCelsius)°C"
        }
        else{
            minCelsiusLabel.text = "最低気温：nil"
        }
        
    }
}
