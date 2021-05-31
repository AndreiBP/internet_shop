//
//  Model.swift
//  blackstarshop
//
//  Created by Андрей Балобанов on 08.05.2021.
//

// главная структура при загрузке приложения


import Foundation

struct RootStruct {
    
   
    let name: String
    let sortOrder: String?
    let image: String?
    //let iconImage: String?
    //let iconImageActive: String?
    var subcategories: [Subcategories]?

    init? (_ data: NSDictionary) {
        name = data["name"] as? String ?? "nil"
        sortOrder = data["sortOrder"] as? String ?? "nil"
        //iconImage = data["iconImage"] as? String ?? .none
        image = data["image"] as? String ?? .none
        //iconImageActive = data["iconImageActive"] as? String ?? .none

        subcategories = [Subcategories]()
        if let subcategoriesArray = data["subcategories"] as? [[String:Any]]{
                    for value in subcategoriesArray{
                        let val = Subcategories(data: value as NSDictionary)!
                        subcategories?.append(val)
                    }
                }
            }
        }

