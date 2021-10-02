//
//  RealmBase.swift
//  blackstarshop
//
//  Created by Андрей Балобанов on 06.07.2021.
//

import UIKit
import RealmSwift

class RealmBase: Object {
    
    @objc dynamic var titleProduct: String? = " "
    @objc dynamic var priceProduct: String? = " "
    @objc dynamic var sizeProduct: String? = " "
    @objc dynamic var imageBasket: String = " "
    @objc dynamic var colorPoduct: String = " "
}
