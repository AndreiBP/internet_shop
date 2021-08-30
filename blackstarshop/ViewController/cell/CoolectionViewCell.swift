//
//  CoolectionViewCell.swift
//  blackstarshop
//
//  Created by Андрей Балобанов on 22.05.2021.
//

import UIKit
import Alamofire
import AlamofireImage

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
  
let imageIcon1 = "http://blackstarshop.ru/"+(menu?.mainImage ?? "mainImage")
            AF.request(imageIcon1).responseImage { response in
                if case .success(let image1) = response.result {
                   // let circleImage = image1.af.imageRoundedIntoCircle()
                    DispatchQueue.main.async {
                        self.image.image = image1
                    }
                } else {
            DispatchQueue.main.async {
                self.image.image = UIImage(named: "noImage")
            }
        }
            }
                //parsingJsonImageUrl2(imageIcon1, image)
        }
    }
}

