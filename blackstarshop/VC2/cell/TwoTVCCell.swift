//
//  TwoTVCCell.swift
//  blackstarshop
//
//  Created by Андрей Балобанов on 28.08.2021.
//

import UIKit
import Alamofire
import AlamofireImage

class TwoTVCCell: UITableViewCell {

    @IBOutlet weak var nameSubCategories: UILabel!
    
    @IBOutlet weak var iconSubCategories: UIImageView!
        
    var menuSubStruct: Subcategories? {
        
        didSet { //  присваивание
            
            nameSubCategories.text = menuSubStruct?.name
            
            let iconsubcategory = website+(menuSubStruct?.iconImage ?? "ошибка iconsubcategories")
            
            AF.request(iconsubcategory).responseImage { response in
                if case .success(let image1) = response.result {
                    let circleImage = image1.af.imageRoundedIntoCircle()
                    DispatchQueue.main.async {
                        self.iconSubCategories.image = circleImage
                    }
                } else {
            DispatchQueue.main.async {
                self.iconSubCategories.image = UIImage(named: "noImage")
            }
        }
            }
            //parsingJsonImageUrl2(iconsubcategory, iconSubCategories)
                    
            }
                                    }
    override func prepareForReuse() {
        super.prepareForReuse()
        iconSubCategories.image = nil
    }
}

