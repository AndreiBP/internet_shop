//
//  SubCategories.swift
//  blackstarshop
//
//  Created by Андрей Балобанов on 10.05.2021.
//

import Foundation

struct Subcategories { //Подкатегории всех категорий

   // let id: String?
    let iconImage: String?
    let sortOrder: String?
    let name: String?
    //let type: String?

    init? (data: NSDictionary) {
        name = data["name"] as? String
        sortOrder = data["sortOrder"] as? String ?? "nil"
        iconImage = data["iconImage"] as? String ?? "nil"
       // id = data["id"] as? String ?? "nil"
        //type = data["type"] as? String ?? "nil"
    }
}
//    let id: Int
//    let iconImage: String
//    let sortOrder: Int
//    let name: String
//    let type: String
//
//    init? (data: NSDictionary) {
//        guard let name = data["name"] as? String,
//        let sortOrder = data["sortOrder"] as? String,
//        let iconImage = data["iconImage"] as? String,
//        let id = data["id"] as? String,
//        let type = data["type"] as? String else {
//            return nil
//        }
//        self.name = name
//        self.sortOrder = Int(sortOrder) ?? 0
//        self.iconImage = iconImage
//        self.type = type
//        self.id = Int(id) ?? 0
//
//    }}

