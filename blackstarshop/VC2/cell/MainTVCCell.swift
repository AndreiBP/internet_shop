//
//  MainTVCCell.swift
//  blackstarshop
//
//  Created by Андрей Балобанов on 28.08.2021.
//

import UIKit

class MainTVCCell: UITableViewCell {

    @IBOutlet weak var iconCategory: UIImageView! {
        didSet {
            iconCategory.layer.cornerRadius = iconCategory.bounds.width / 2
        }
    }
    @IBOutlet weak var nameCategory: UILabel!
    
    var menu: RootStruct? {
        
        didSet { //  присваивание
            
            nameCategory.text = menu?.name
            
            let iconcategory = website+(menu?.image ?? "ошибка iconcategory")
            
            parsingJsonImageUrl2(iconcategory, iconCategory)
                    
            }
                        }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconCategory.image = nil
    }
                                }
