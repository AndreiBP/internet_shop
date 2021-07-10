//
//  PopTableViewController.swift
//  blackstarshop
//
//  Created by Андрей Балобанов on 19.06.2021.
//

import UIKit

class PopTableViewController: UITableViewController {
   
    var infoProduct = [Offers]()
    
    var nameProduct = ""
    var priceProduct = ""
    var imageProduct = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //расстояние между строк и ширина(таблицы) в таблице согласно содержимого ячеек
//    override func viewWillLayoutSubviews() {
       // preferredContentSize = CGSize(width: 500, height: tableView.contentSize.height)
       // preferredContentSize = CGSize(width: 500, height: tableView.contentSize.height)
//    }
    
    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoProduct.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellPopVC", for: indexPath) as! PopTableViewCell
        
        let size = infoProduct[indexPath.row].size
        cell.sizeProduct.text = size
                
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let a = ProductViewController()
        
        let cell = tableView.cellForRow(at: indexPath) as! PopTableViewCell
        
        //установка галки выбора и передача данных в корзину
        if  cell.selectionProduct.image == .none {
            cell.selectionProduct.image = UIImage(named: "galka")
            
            a.sizePR = infoProduct[indexPath.row].size
            
            // запись выбранного товара в базу Realm
            let funcRealmBase = FunctionRealmBase.functionRealmBase
           funcRealmBase.saveTovarRealmBase(titleProduct: nameProduct, priceProduct: priceProduct, sizeProduct: a.sizePR, iconString: imageProduct)           
            
            tableView.reloadData()
            
        }  else {
            cell.selectionProduct.image = .none
            tableView.reloadData()
        }
        
        self.tableView.reloadData()
    }

}
