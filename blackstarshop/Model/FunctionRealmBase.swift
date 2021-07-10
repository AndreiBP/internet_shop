//
//  FunctionRealmBase.swift
//  blackstarshop
//
//  Created by Андрей Балобанов on 06.07.2021.
//

import UIKit
import RealmSwift

class FunctionRealmBase {
   
    static var functionRealmBase = FunctionRealmBase()
    
    var tovar: Results<RealmBase>!

    //показ всех обьектов
    func allObject() {
        let realm = try! Realm()
        tovar = realm.objects(RealmBase.self)
    }
    
    //сохранение в realm для показа в корзине
    func saveTovarRealmBase(titleProduct: String, priceProduct: String, sizeProduct: String, iconString: String) {
        let realm = try! Realm()
        let object = RealmBase()
        object.titleProduct = titleProduct
        object.priceProduct = priceProduct
        object.sizeProduct = sizeProduct
        object.imageBasket = iconString
        try! realm.write {
            realm.add(object)
            }
        }
    
    //удаление товара из корзины
    func deleteTovarRealmBase(index: Int) {
        let realm = try! Realm()
        try! realm.write {
            let deleteTovar = tovar[index]
            realm.delete(deleteTovar)
            }
        }
}
