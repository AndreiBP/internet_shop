//
//  MainTVC.swift
//  blackstarshop
//
//  Created by Андрей Балобанов on 28.08.2021.
//

import UIKit
import SwiftUI

class MainTVC: UITableViewController {
    
    var rootStruct: [RootStruct] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readAlamofireDataJson()
    }

    //парсинг товаров в основную структуру
    func readAlamofireDataJson() {
        
        let urlClientLoading = UrlClientloading()
        
            urlClientLoading.getJson { (jsonLoading) in

                switch jsonLoading {
                
                    case .success(let root):
                        self.rootStruct = root
                    
                    case .failure:
                        self.rootStruct = []
                            }
                            self.tableView.reloadData()
                                }
                                    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return rootStruct.count }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    let cell = tableView.dequeueReusableCell(withIdentifier: "MainTVCCell", for: indexPath) as! MainTVCCell
    
        cell.menu = rootStruct[indexPath.row]
        
    
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let twotvc = storyboard?.instantiateViewController(identifier: "TwoTVC") as! TwoTVC
       
        guard let categori = rootStruct[indexPath.row].subcategories else { return }
        
        if categori.count != 0 {
            twotvc.subStruct = categori
        } else {
            //при отсутствии подкатегории выходит соответствующий Label, сделано через backgraundview у TableView
            let labelnotovar = UILabel(frame: self.view.frame)
            labelnotovar.numberOfLines = 0
            labelnotovar.textAlignment = .center
            labelnotovar.text = "Извините, товары отсутствуют"
            twotvc.tableView.backgroundView = labelnotovar
        }
        navigationController?.pushViewController(twotvc, animated: true)
    }
}
