//
//  cell1.swift
//  blackstarshop
//
//  Created by Андрей Балобанов on 08.05.2021.
//

import UIKit

class cell1: UITableViewCell {

@IBOutlet weak var nameTextCategory: UILabel!
@IBOutlet weak var iconImage: UIImageView!
    
    func cornerRadius() {
        //iconImage?.layer.masksToBounds = true
        iconImage?.layer.cornerRadius = iconImage.frame.size.width / 2
        iconImage?.clipsToBounds = true
    }
}
