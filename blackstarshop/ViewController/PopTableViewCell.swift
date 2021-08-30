//
//  PopTableViewCell.swift
//  blackstarshop
//
//  Created by Андрей Балобанов on 19.06.2021.
//

import UIKit

class PopTableViewCell: UITableViewCell {

    @IBOutlet weak var colorProduct: UILabel!
    @IBOutlet weak var sizeProduct: UILabel!
    
    var infoproduct: Offers? {
        didSet {
            sizeProduct.text = infoproduct?.size
           // colorProduct.text = infoproduct.colorProduct
        }
    }
    
    @IBOutlet weak var colorProductIcon: UIImageView! {
        didSet {
            colorProductIcon.layer.cornerRadius = colorProductIcon.bounds.height / 2
        }
    }
    
    //        let a = ProductViewController()
//        
//        a.sizePR = infoproduct?.size ?? "размер отсутствует"
//               
//        // запись выбранного товара в базу Realm
//        let b = PopTableViewController()
//        let funcRealmBase = FunctionRealmBase.functionRealmBase
//        funcRealmBase.saveTovarRealmBase(titleProduct: b.nameProduct, priceProduct: b.priceProduct, sizeProduct: a.sizePR, iconString: b.imageProduct)
    
}
