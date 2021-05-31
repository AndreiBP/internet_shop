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
        
        threeTableVC.readAlamofireDataJsonProduct()
        
        navigationController?.pushViewController(threeTableVC, animated: true)

    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
