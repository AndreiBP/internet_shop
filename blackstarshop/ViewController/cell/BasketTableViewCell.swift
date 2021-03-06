//
//  BasketTableViewCell.swift
//  blackstarshop
//
//  Created by Андрей Балобанов on 27.06.2021.
//

import UIKit

class BasketTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewProduct: UIImageView!
    @IBOutlet weak var titleProduct: UILabel!
    @IBOutlet weak var sizeProduct: UILabel!
    @IBOutlet weak var colorProduct: UILabel!
    @IBOutlet weak var priceProduct: UILabel!
 
    var tovar: RealmBase? {
        didSet {
            titleProduct.text = tovar?.titleProduct
            sizeProduct.text = "размер \(tovar?.sizeProduct ?? "-")"
            colorProduct.text = "\(tovar?.colorPoduct ?? "-") цвет"
            priceProduct.text = tovar?.priceProduct
            
            
            if let myNumber = NumberFormatter().number(from: (tovar?.priceProduct ?? "ошибка tovar?.priceProduct")) {
                let myInt = myNumber.intValue
                    priceProduct.text = "\(String(myInt)) рублей "
            }
            
            let icontovar = website + (tovar?.imageBasket ?? "ошибка iconcategory")
            
            parsingJsonImageUrl(icontovar, imageViewProduct)

        }
    }
}
