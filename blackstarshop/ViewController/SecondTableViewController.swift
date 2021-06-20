//
//  SecondTableViewController.swift
//  blackstarshop
//
//  Created by Андрей Балобанов on 16.05.2021.
//

//загрузка экрана подкатегорий

import UIKit

class SecondTableViewController: UITableViewController {
    
    var categori: [Subcategories]?
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categori?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
      let cell = tableView.dequeueReusableCell(withIdentifier: "secondCell", for: indexPath) as! cellSecondTVC
        
        let model = categori?[indexPath.row]

        cell.nameLabel.text = model?.name
        
        let imageIcon1 = "http://blackstarshop.ru/"+((model?.iconImage)!)
        
        if cell.iconImageActive != nil {
            parsingJsonImageUrl(imageIcon1, cell.iconImageActive) }
        
//        if cell.iconImageActive != nil {
//            loadImage(cell.iconImageActive, imageIcon1) }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let threeTableVC = storyboard?.instantiateViewController(identifier: "threeCVC") as! CollectionViewController

        let product = categori![indexPath.row].id!
        
        let urlP = urlJsonProduct + (product)
        urlProduct = urlP
        
        print(urlProduct)
        
        navigationController?.pushViewController(threeTableVC, animated: true)
        //threeTableVC.viewDidLoad()

    }
}
