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
   
    
    var menu: Product? {
    
        didSet { //  присваивание
    
            titleName.text = menu?.name
                price.text = menu?.price
            if let myNumber = NumberFormatter().number(from: (menu?.price ?? "menu?.price")) {
                let myInt = myNumber.intValue
                price.text = "\(String(myInt)) руб." }
  
let imageIcon1 = website + (menu?.mainImage ?? "mainImage")

                parsingJsonImageUrl(imageIcon1, image)
            }
    }
}

