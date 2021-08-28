//
//  CoolectionViewCell.swift
//  blackstarshop
//
//  Created by Андрей Балобанов on 22.05.2021.
//

import UIKit

class CoolectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleName: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var buttonBuy: UIButton! {
        didSet {
            buttonBuy.layer.cornerRadius = buttonBuy.bounds.height / 2
        }
    }
    
    var menu: Product? {
    
        didSet { //  присваивание
    
    titleName.text = menu?.name
            
            if let myNumber = NumberFormatter().number(from: (menu?.price ?? "")) {
                let myInt = myNumber.intValue
                price.text = String(myInt) }
  
let imageIcon1 = "http://blackstarshop.ru/"+(menu?.mainImage ?? "")
                parsingJsonImageUrl2(imageIcon1, image)
        }
    }
}

