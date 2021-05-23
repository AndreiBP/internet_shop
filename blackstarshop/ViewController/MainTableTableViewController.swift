//
//  MainTableTableViewController.swift
//  blackstarshop
//
//  Created by Андрей Балобанов on 08.05.2021.
//
import Foundation
import UIKit
//import Alamofire

class MainTableTableViewController: UITableViewController {
    
//    override func viewWillAppear(_ animated: Bool) {
//        let cornerRadius = cell1()
//         cornerRadius.cornerRadius()
//        self.tableView.reloadData()
//    }
    
    var rootStruct : [RootStruct] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readAlamofireDataJson()
    }
    
    
    func readAlamofireDataJson() {
        
        let urlClientLoading = UrlClientloading()
        
        urlClientLoading.getJson { (jsonLoading) in
            DispatchQueue.main.async {
                switch jsonLoading {
                
                case .success(let root):
                    self.rootStruct = root
                case .failure:
                   self.rootStruct = []
                            }
                self.tableView.reloadData()
                
            }
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
        
        //let url = URL(string: imageIcon1)
       
            let image2 = parsingJsonImageUrl(image: imageIcon1)
            cell.iconImage.image = image2
        
//        AF.request(imageIcon1, method: .get).response { response in
//          switch response.result {
//           case .success(let responseData):
//            cell.iconImage.image = UIImage(data: responseData!, scale: 1) ?? UIImage(named: "noImage")
//           case .failure(let error):
//            print("error---",error)
//          }
//       }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath) as! cell1
        
       
        let categori = rootStruct[indexPath.row]

        cell.nameTextCategory.text = categori.name
        print(categori)

        
//        let secondTableVC = storyboard.instantiateViewController(identifier: "secondTVC") as! SecondTableViewController
//
//        let categori = rootStruct[indexPath.row]
//        secondTableVC.categori = categori.subcategories
//
//        print(categori)
      //  navigationController?.pushViewController(secondTableVC, animated: true)
    }
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

