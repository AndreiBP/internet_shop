//
//  RootClass.swift
//  blackstarshop
//
//  Created by Андрей Балобанов on 10.05.2021.
//

import Foundation

struct RootClass: Decodable { //Главная категория, перечисление всех катерорий
    
    let class263: Class263
    let class67: Class67
    let class68: Class68
    let class69: Class69
    let class73: Class73
    let class74: Class74
    let class156: Class156
    let class165: Class165
    let class233: Class233
    let class0: Class0



private enum CodingKeys: String, CodingKey {
        case class0 = "0"
        case class67 = "67"
        case class68 = "68"
        case class69 = "69"
        case class73 = "73"
        case class74 = "74"
        case class156 = "156"
        case class165 = "165"
        case class233 = "233"
        case class263 = "263"
    }
}
