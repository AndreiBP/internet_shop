//
//  PopTVCell.swift
//  blackstarshop
//
//  Created by Андрей Балобанов on 01.09.2021.
//

import UIKit

class PopTVCell: UITableViewCell {
    
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    
    var infoproduct: Offers? {
        didSet {
            sizeLabel.text = infoproduct?.size
           // colorProduct.text = infoproduct.colorProduct
        }
    }
}
