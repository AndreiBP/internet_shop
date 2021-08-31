//
//  MainTVCCell.swift
//  blackstarshop
//
//  Created by Андрей Балобанов on 28.08.2021.
//

import UIKit

class MainTVCCell: UITableViewCell {

    @IBOutlet weak var iconCategory: UIImageView! 

    @IBOutlet weak var nameCategory: UILabel!
    
    var menu: RootStruct? {
        
        didSet { //  присваивание
            
            nameCategory.text = menu?.name
             let iconcategory = website+(menu?.image ?? "ошибка iconcategory")
            parsingJsonImageUrl(iconcategory, iconCategory)
        
                        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconCategory.image = nil
    }
                                }
