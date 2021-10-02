//
//  ProductCoolVCell.swift
//  blackstarshop
//
//  Created by Андрей Балобанов on 26.09.2021.
//

import UIKit

class ProductColVCell: UICollectionViewCell {
    @IBOutlet weak var imageProduct: UIImageView!
    
    
    var imageP2: ProductImages? {
        
        didSet { //  присваивание
  
            let imageIcon1 = website + (imageP2?.imageURL ?? "mainImage")

                parsingJsonImageUrl(imageIcon1, imageProduct)
            }
    }
    
}
