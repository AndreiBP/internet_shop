//
//  SubCategories.swift
//  blackstarshop
//
//  Created by Андрей Балобанов on 10.05.2021.
//

import Foundation

struct Subcategories { //Подкатегории всех категорий

    let id: String?
    let iconImage: String?
    let sortOrder: String?
    let name: String?
    let type: String?

    init? (data: NSDictionary) {
        name = data["name"] as? String
        sortOrder = data["sortOrder"] as? String ?? "nil"
        iconImage = data["iconImage"] as? String ?? "nil"
        id = data["id"] as? String ?? "nil"
        type = data["type"] as? String ?? "nil"
    }
}
