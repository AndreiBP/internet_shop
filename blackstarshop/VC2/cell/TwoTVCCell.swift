//
//  TwoTVCCell.swift
//  blackstarshop
//
//  Created by Андрей Балобанов on 28.08.2021.
//

import UIKit

class TwoTVCCell: UITableViewCell {

    @IBOutlet weak var nameSubCategories: UILabel!
    
    @IBOutlet weak var iconSubCategories: UIImageView!
        
    var menuSubStruct: Subcategories? {
        
        didSet { //  присваивание
            
            nameSubCategories.text = menuSubStruct?.name
            
            let iconsubcategory = website+(menuSubStruct?.iconImage ?? "ошибка iconsubcategories")
            
            parsingJsonImageUrl(iconsubcategory, iconSubCategories)
                    
            }
                                    }
    override func prepareForReuse() {
        super.prepareForReuse()
        iconSubCategories.image = nil
    }
}

