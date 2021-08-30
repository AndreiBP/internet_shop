//
//  BasketTableViewCell.swift
//  blackstarshop
//
//  Created by Андрей Балобанов on 27.06.2021.
//

import UIKit
import Alamofire
import AlamofireImage

class BasketTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewProduct: UIImageView!
    @IBOutlet weak var titleProduct: UILabel!
    @IBOutlet weak var sizeProduct: UILabel!
    @IBOutlet weak var colorProduct: UILabel!
    @IBOutlet weak var priceProduct: UILabel!
 
    var tovar: RealmBase? {
        didSet {
            titleProduct.text = tovar?.titleProduct
            sizeProduct.text = tovar?.sizeProduct
           // colorProduct.text = tovar?.colorProduct
            priceProduct.text = tovar?.priceProduct
            
            if let myNumber = NumberFormatter().number(from: (tovar?.priceProduct ?? "ошибка tovar?.priceProduct")) {
                let myInt = myNumber.intValue
                    priceProduct.text = String(myInt) }
            
            let a = (tovar?.imageBasket ?? "ошибка iconcategory")
            
            AF.request(a).responseImage { response in
                if case .success(let image1) = response.result {
                    let circleImage = image1.af.imageRoundedIntoCircle()
                    DispatchQueue.main.async {
                        self.imageViewProduct.image = circleImage
                    }
                } else {
            DispatchQueue.main.async {
                self.imageViewProduct.image = UIImage(named: "noImage")
            }
        }
            }
        }
    }
}
