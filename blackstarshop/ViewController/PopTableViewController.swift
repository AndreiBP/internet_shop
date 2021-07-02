//
//  PopTableViewController.swift
//  blackstarshop
//
//  Created by Андрей Балобанов on 19.06.2021.
//

import UIKit

class PopTableViewController: UITableViewController {
   
    var infoProduct = [Offers]()
    var ar = [Tovar]()
    
    var descriptionProduct = ""
    var priceProduct = ""
//
//    var quantityProduct = 0
//    var productID = 0
    
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
            
//            productViewController2.arrayProduct?[indexPath.row].sizeProduct = a.sizePR
//            productViewController2.arrayProduct?[indexPath.row].priceProduct = priceProduct
//            productViewController2.arrayProduct?[indexPath.row].titleProduct = descriptionProduct
           
            ar.append(Tovar.init(titleProduct: descriptionProduct, priceProduct: priceProduct, sizeProduct: a.sizePR, image: .none))
            print(ar)
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    guard let productViewController2 = storyboard.instantiateViewController(identifier: "BasketViewController") as? BasketViewController else { return }
            
            productViewController2.arrayProduct?[indexPath.row] = ar[indexPath.row]
            
            
          //  productViewController2.arrayProduct?[indexPath.row] = Tovar.init(titleProduct: descriptionProduct, priceProduct: priceProduct, sizeProduct: a.sizePR, image: .none)
            
            
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
//        productID = Int(infoProduct[indexPath.row].productOfferID) ?? 0
//        print(productID)
        
        
        self.tableView.reloadData()
    }

}
