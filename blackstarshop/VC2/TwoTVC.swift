//
//  TwoTVC.swift
//  blackstarshop
//
//  Created by Андрей Балобанов on 28.08.2021.
//

import UIKit

class TwoTVC: UITableViewController {

    var subStruct: [Subcategories] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return subStruct.count }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TwoTVCCell", for: indexPath) as! TwoTVCCell

        cell.menuSubStruct = subStruct[indexPath.row]

        return cell
    }
    
    //переход при нажатии на ячейку выбранной подкатегории
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let collectionview = storyboard?.instantiateViewController(identifier: "threeCVC") as! CollectionViewController
        
        guard let product = subStruct[indexPath.row].id else { return }
            let urlP = urlJsonProduct + (product)
                urlProduct = urlP
         
    navigationController?.pushViewController(collectionview, animated: true)
        collectionview.readAlamofireDataJsonProduct()
                }
    }
