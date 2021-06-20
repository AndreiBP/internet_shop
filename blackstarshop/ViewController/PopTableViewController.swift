//
//  PopTableViewController.swift
//  blackstarshop
//
//  Created by Андрей Балобанов on 19.06.2021.
//

import UIKit

class PopTableViewController: UITableViewController {
   
    var infoProduct = [Offers]()
    
    var quantityProduct = 0
    var productID = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
     //   tableView.isScrollEnabled = false //отключение скрол
        readAlamofireDataJsonOffers()
    }
    
    //загрузка offers
    func readAlamofireDataJsonOffers() {

        let urlClientLoading = UrlClientloading3()

        urlClientLoading.getJson3 { (jsonLoading) in

            switch jsonLoading {

                case .success(let root):
                    self.infoProduct = root
                case .failure:
                    self.infoProduct = []
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
        
    
    //расстояние между строк и ширина(таблицы) в таблице согласно содержимого ячеек
    override func viewWillLayoutSubviews() {
       // preferredContentSize = CGSize(width: 500, height: tableView.contentSize.height)
       // preferredContentSize = CGSize(width: 500, height: tableView.contentSize.height)
    }
    
    
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
      
        let cell = tableView.cellForRow(at: indexPath) as! PopTableViewCell
        
        //установка галки выбора
        if  cell.selectionProduct.image == .none {
            cell.selectionProduct.image = UIImage(named: "galka")
            tableView.reloadData()
        }  else {
            cell.selectionProduct.image = .none
            tableView.reloadData()
        }
        
        //учет количества товара
//        if Int(infoProduct[indexPath.row].quantity) != 0 {
//        quantityProduct -= 1
//        print(quantityProduct)
//        } else { print("товар отсутствует") }
        
        //выбранный продукт
        productID = Int(infoProduct[indexPath.row].productOfferID) ?? 0
        print(productID)
        
        self.tableView.reloadData()
    }

}
