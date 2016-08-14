//
//  HomeCell.swift
//  SlideOutMenuExample
//
//  Created by Raja Ayyan on 14/08/16.
//  Copyright © 2016 metricstream. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell {
    
    
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        cellImage.layer.cornerRadius = 5.0
        cellImage.layer.shadowColor = UIColor.blueColor().CGColor
        cellImage.layer.shadowRadius = 10.0
        cellImage.clipsToBounds = true
    }
    
    func configureCell(title: String){
        self.cellLabel.text = title
    }

   
}
