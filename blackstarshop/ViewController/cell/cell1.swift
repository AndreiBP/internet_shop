//
//  cell1.swift
//  blackstarshop
//
//  Created by Андрей Балобанов on 08.05.2021.
//

import UIKit

class cell1: UITableViewCell {

@IBOutlet weak var nameTextCategory: UILabel!
    @IBOutlet weak var iconImage: UIImageView! {
        didSet {
            iconImage.layer.cornerRadius = iconImage.bounds.height / 2
        }
    }
    
}
