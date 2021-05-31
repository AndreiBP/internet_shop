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
    @IBOutlet weak var buttonBuy: UIButton!
    
    var menu: Product? {
    
        didSet { //  присваивание
    
    titleName.text = menu?.name
    price.text = menu?.price
     
            
            
            
    //let imageIcon1 = "http://blackstarshop.ru/"+(menu!.mainImage)
    
           
        
    // let image2 = parsingJsonImageUrl(image: imageIcon1)
    //image.image = UIImage(data: image2)
                
                
//    if let image = menu?.imageName {
//    imageView.image = UIImage(named: image)
//    }
    }
    }
}

