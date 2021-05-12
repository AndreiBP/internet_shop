//
//  Model.swift
//  blackstarshop
//
//  Created by Андрей Балобанов on 08.05.2021.
//

import Foundation
import UIKit
struct Class263: Decodable { //"Последний размер"

    let name: String
    let sortOrder: String?
    let image: String?
    let iconImage: String?
    let iconImageActive: String?
    //let subcategories: [subcategories]?
}

struct Class67: Decodable { //Аксессуары

    let name: String
    let sortOrder: String?
    let image: String?
    let iconImage: String?
    let iconImageActive: String?
    //let subcategories: [subcategories]?
}

struct Class68: Decodable { //Женская

    let name: String
    let sortOrder: String?
    let image: String?
    let iconImage: String?
    let iconImageActive: String?
   // let subcategories: [subcategories]?
}

struct Class69: Decodable { //Мужская

    let name: String
    let sortOrder: String?
    let image: String?
    let iconImage: String?
    let iconImageActive: String?
   // let subcategories: [subcategories]?
}

struct Class73: Decodable { //Детская

    let name: String
    let sortOrder: String?
    let image: String?
    let iconImage: String?
    let iconImageActive: String?
   // let subcategories: [subcategories]?
}

struct Class74: Decodable { //Коллекции

    let name: String
    let sortOrder: String?
    let image: String?
    let iconImage: String?
    let iconImageActive: String?
  //  let subcategories: [subcategories]?
}

struct Class156: Decodable { //Скидки

    let name: String
    let sortOrder: String?
    let image: String?
    let iconImage: String?
    let iconImageActive: String?
  //  let subcategories: [subcategories]?
}

struct Class165: Decodable { //Новинки

    let name: String
    let sortOrder: String?
    let image: String?
    let iconImage: String?
    let iconImageActive: String?
    //let subcategories: [subcategories]?
}

struct Class233: Decodable { //Marketplace

    let name: String
    let sortOrder: String?
    let image: String?
    let iconImage: String?
    let iconImageActive: String?
   // let subcategories: [subcategories]?
}

struct Class0: Decodable { //Предзаказ

    let name: String
    let sortOrder: Int?
    let image: String?
    let iconImage: String?
    let iconImageActive: String?
   // let subcategories: [subcategories]?
}
