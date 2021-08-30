//
//  MainTVCCell.swift
//  blackstarshop
//
//  Created by Андрей Балобанов on 28.08.2021.
//

import UIKit
import AlamofireImage
import Alamofire

class MainTVCCell: UITableViewCell {

    @IBOutlet weak var iconCategory: UIImageView!

    @IBOutlet weak var nameCategory: UILabel!
    
    var menu: RootStruct? {
        
        didSet { //  присваивание
            
            nameCategory.text = menu?.name
             let iconcategory = website+(menu?.image ?? "ошибка iconcategory")
            
            AF.request(iconcategory).responseImage { response in
                if case .success(let image1) = response.result {
                    let circleImage = image1.af.imageRoundedIntoCircle()
                    DispatchQueue.main.async {
                        self.iconCategory.image = circleImage
                    }
                } else {
                    DispatchQueue.main.async {
                        self.iconCategory.image = UIImage(named: "noImage")
                    }
                }
                
            }

            //parsingJsonImageUrl2(iconcategory, iconCategory)
            }
        
                        }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconCategory.image = nil
    }
                                }
