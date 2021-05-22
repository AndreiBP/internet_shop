//
//  Model.swift
//  blackstarshop
//
//  Created by Андрей Балобанов on 08.05.2021.
//

import Foundation
import UIKit

struct Struct111 { 

    let name: String
    let sortOrder: String?
    let image: String?
    //let iconImage: String?
    //let iconImageActive: String?
    let subcategories: [Subcategories]?
    
    
    init? (data: NSDictionary) {
        name = data["name"] as? String ?? "nil"
        sortOrder = data["sortOrder"] as? String ?? "nil"
        //iconImage = data["iconImage"] as? String ?? .none
        image = data["image"] as? String ?? .none
        //iconImageActive = data["iconImageActive"] as? String ?? .none
        subcategories = data["subcategories"] as? [Subcategories] ?? .none
    }
//}
//    init? (data: NSDictionary) {
//          guard let name = data["name"] as? String,
//        let sortOrder = data["sortOrder"] as? String,
//        let image = data["image"] as? String,
//        let iconImage = data["iconImage"] as? String,
//        let iconImageActive = data["iconImageActive"] as? String,
//        let subcategories = data["subcategories"] as? [Subcategories] else {
//            return nil
//          }

//        self.name = name
//        self.sortOrder = Int(sortOrder) ?? 0
//        self.image = image
//        self.iconImage = iconImage
//        self.iconImageActive = iconImageActive
//        self.subcategories = subcategories
//
//    }
}

