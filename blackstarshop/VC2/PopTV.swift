//
//  PopTV.swift
//  blackstarshop
//
//  Created by Андрей Балобанов on 01.09.2021.
//

import UIKit

class PopTV: UITableView, UITableViewDataSource, UITableViewDelegate {
   
    var infoProduct = [Offers]()
    
    var nameProduct = ""
    var priceProduct = ""
    var imageProduct = ""
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoProduct.count
    }

    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellPopVC", for: indexPath) as! PopTVCell
        cell.infoproduct = infoProduct[indexPath.row]
        
        return cell
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let product = ProductViewController()
      
//             запись выбранного товара в базу Realm
            let funcRealmBase = FunctionRealmBase.functionRealmBase
        funcRealmBase.saveTovarRealmBase(titleProduct: nameProduct, priceProduct: priceProduct, sizeProduct: product.sizePR, iconString: imageProduct)

     }

}

