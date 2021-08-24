//
//  Product.swift
//  blackstarshop
//
//  Created by Андрей Балобанов on 30.05.2021.
//

// структура выбранных объектов после нажатия подкатегорий

import UIKit

struct Product {
    
    let name: String?
    let description: String?
    let colorName: String?
    let mainImage: String?
    var productImages: [ProductImages]?
    var offers: [Offers]?
    let price: String?
    
    init? (_ data: NSDictionary) {
        name = data["name"] as? String ?? "nil"
        description = data["description"] as? String ?? "nil"
        colorName = data["colorName"] as? String ?? "nil"
        mainImage = data["mainImage"] as? String ?? "nil"
        price = data["price"] as? String ?? "nil"
        
        productImages = [ProductImages]()
        if let productImagesArray = data["productImages"] as? [[String:Any]]{
                    for value in productImagesArray {
                        let val = ProductImages(data: value as NSDictionary)!
                        productImages?.append(val) }
                        }
        offers = [Offers]()
        if let offersArray = data["offers"] as? [[String:Any]]{
                    for value in offersArray {
                        let val = Offers(data: value as NSDictionary)!
                        offers?.append(val) }
                        }
    }
}
        

struct ProductImages {
    let imageURL: String
    //let sortOrder: String
    
    init? (data: NSDictionary) {
        imageURL = data["imageURL"] as? String ?? "nil"
    }
}
struct Offers {
    let size: String
    let productOfferID: String
    let quantity: String
    
    init? (data: NSDictionary) {
        size = data["size"] as? String ?? "nil"
        productOfferID = data["productOfferID"] as? String ?? "nil"
        quantity = data["quantity"] as? String ?? "nil"
    }
}


