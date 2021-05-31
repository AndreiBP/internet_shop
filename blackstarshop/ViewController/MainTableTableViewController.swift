//
//  MainTableTableViewController.swift
//  blackstarshop
//
//  Created by Андрей Балобанов on 08.05.2021.
//

// загрузка главного экрана

import UIKit

class MainTableTableViewController: UITableViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
    }
    
    var rootStruct: [RootStruct] = []
    var subStruct: [Subcategories] = []
    var indexL = IndexPath()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readAlamofireDataJson()
    }
    
    
    func readAlamofireDataJson() {
        
        let urlClientLoading = UrlClientloading()
        
        urlClientLoading.getJson { (jsonLoading) in

           // DispatchQueue.main.async {
            switch jsonLoading {
                
                case .success(let root):
                    self.rootStruct = root
                    
                case .failure:
                   self.rootStruct = []
                            }
            
                self.tableView.reloadData()
              
               // }
            }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rootStruct.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let cell = tableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath) as! cell1
        
        let model = rootStruct[indexPath.row]
        
        cell.nameTextCategory.text = model.name
       
        let imageIcon1 = "http://blackstarshop.ru/"+(model.image!)
        
        if cell.iconImage != nil {
            parsingJsonImageUrl(imageIcon1, cell.iconImage) }
        
        //cell.iconImage.layer.cornerRadius = cell.iconImage.frame.size.width / 2
        
    
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
//        guard let model = rootStruct[indexPath.row].subcategories else {
//            print("-------------------")
//            return
//        }
//            subStruct = model
//
//        let substruct = subStruct[indexPath.row]
//
//        indexL = indexPath
//
//
//        tableView.indexPathsForVisibleRows?.forEach {_ in
//            if let cell = tableView.cellForRow(at: indexL) as? cell1 {
//                cell.nameTextCategory.text = substruct.name
//               }
//        }
        
        
        let secondTableVC = storyboard?.instantiateViewController(identifier: "secondTVC") as! SecondTableViewController

        let categori = rootStruct[indexPath.row]
        secondTableVC.categori = categori.subcategories

        navigationController?.pushViewController(secondTableVC, animated: true)
    }
}
