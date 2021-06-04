//
//  MainTableTableViewController.swift
//  blackstarshop
//
//  Created by Андрей Балобанов on 08.05.2021.
//

// загрузка главного экрана

import UIKit

class MainTableTableViewController: UITableViewController {
    
    var rootStruct: [RootStruct] = []
    var subStruct: [Subcategories] = []
   // var indexL = IndexPath()
    var number = 0
    
   
    @IBAction func refreshToMain(_ sender: Any) {
        number = 0
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "mainTVC")
        var viewcontrollers = self.navigationController!.viewControllers
        viewcontrollers.removeLast()
        viewcontrollers.append(vc)
        self.navigationController?.setViewControllers(viewcontrollers, animated: true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readAlamofireDataJson()
    }
    
    
    func readAlamofireDataJson() {
        
        let urlClientLoading = UrlClientloading()
        
        urlClientLoading.getJson { (jsonLoading) in

//            DispatchQueue.main.async {
            switch jsonLoading {
                
                case .success(let root):
                    self.rootStruct = root
                    
                case .failure:
                   self.rootStruct = []
                            }
            
                self.tableView.reloadData()
              
          //      }
            }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if subStruct.count != 0 {
            return subStruct.count
            } else {
            return rootStruct.count
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let cell = tableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath) as! cell1
        
        if subStruct.count != 0 {
            
            let model = subStruct[indexPath.row]
            
                    cell.nameTextCategory.text = model.name
            
            let imageIcon1 = "http://blackstarshop.ru/"+(model.iconImage!)
            
                    if cell.iconImage != nil {
                        parsingJsonImageUrl(imageIcon1, cell.iconImage) }
                   return cell
        } else {
            
            let model = rootStruct[indexPath.row]
            
                    cell.nameTextCategory.text = model.name
            
                    let imageIcon1 = "http://blackstarshop.ru/"+(model.image!)
            
                    if cell.iconImage != nil {
                        parsingJsonImageUrl(imageIcon1, cell.iconImage) }
            }
            return cell
            }
       
//
//        let model = rootStruct[indexPath.row]
//
//        cell.nameTextCategory.text = model.name
//
//        let imageIcon1 = "http://blackstarshop.ru/"+(model.image!)
//
//        if cell.iconImage != nil {
//            parsingJsonImageUrl(imageIcon1, cell.iconImage) }
        
        //cell.iconImage.layer.cornerRadius = cell.iconImage.frame.size.width / 2
        
    
        //return cell
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
   
//        let secondTableVC = storyboard?.instantiateViewController(identifier: "secondTVC") as! SecondTableViewController
//
//        let categori = rootStruct[indexPath.row]
//        secondTableVC.categori = categori.subcategories
//
        //navigationController?.pushViewController(secondTableVC, animated: true)
       // let categori = rootStruct[indexPath.row].subcategories
        //subStruct = categori!
        
        if number == 1 {
            
            let threeTableVC = storyboard?.instantiateViewController(identifier: "threeCVC") as! CollectionViewController

            let product = subStruct[indexPath.row].id!
            
            let urlP = urlJsonProduct + (product)
            urlProduct = urlP
            
            print(urlProduct)
            
            threeTableVC.readAlamofireDataJsonProduct()
            
            navigationController?.pushViewController(threeTableVC, animated: true)
            }
        
        if number == 0 {
        
        let categori = rootStruct[indexPath.row].subcategories
        subStruct = categori!
        tableView.reloadData()
        number = 1
            }
        }
    }

