//
//  MainTableTableViewController.swift
//  blackstarshop
//
//  Created by Андрей Балобанов on 08.05.2021.
//
import Foundation
import UIKit
import Alamofire

class MainTableTableViewController: UITableViewController {
    
    var rootClass : [RootClass] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readAlamofireDataJson()
        }
    
    func readAlamofireDataJson() {
        
        let urlClientLoading = UrlClientloading()
        
        urlClientLoading.getJson { (jsonLoading) in
            DispatchQueue.main.async { [self] in
                switch jsonLoading {
                case .success(let root):
                self.rootClass = [root]
                    //self.showData()
                case .failure:
                   self.rootClass = []
                    //self.showError()
                }
               self.tableView.reloadData() }
        }
    }
    
    
    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rootClass.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let cell = tableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath) as! cell1
        
        let model = rootClass[indexPath.row]
        
        cell.nameTextCategory.text = model.class263.name
       
        let imageIcon = model.class263.iconImage
        
        let image = parsingJsonImageUrl(image: imageIcon!)
        
        cell.iconImage.image = image
        
        return cell
        
//        AF.request(imageIcon!).responseImage { (response) in
//            if let image = try? response.result.get() {
//                DispatchQueue.main.async {
//                    cell.iconImage.image = image
//                }
//            }
//        } .resume()
//
    
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
