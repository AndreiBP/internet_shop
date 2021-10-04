//
//  BasketTableViewController.swift
//  blackstarshop
//
//  Created by Андрей Балобанов on 27.06.2021.
//

import UIKit

class BasketViewController: UIViewController, UIAlertViewDelegate {
    
    @IBOutlet weak var basketTableView: UITableView!
    
    @IBOutlet weak var totalPrice: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        ObjectRealm.allObject()
        basketTableView.reloadData()
       totalPrice.text = String(summProduct)
            }
    
    let ObjectRealm = FunctionRealmBase.functionRealmBase
    
    override func viewDidLoad() {
            super.viewDidLoad() }}

extension BasketViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ObjectRealm.tovar.count
            }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasketCell", for: indexPath) as! BasketTableViewCell
        
        cell.tovar = self.ObjectRealm.tovar[indexPath.row]

        return cell
}
  
    //свайп справа "удаления"
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let performed1 = UIContextualAction(style: .destructive, title: "Удалить") {  (contextualAction, view , boolValue) in
            
           // создаем alert спрашиваем удалить товар из корзины или нет
                    let alertVC = UIAlertController(
                        title: "Удалить товар из корзины?", message: .none,
                        preferredStyle: .alert)
            
            alertVC.addAction(UIAlertAction(title: "Да", style: .default, handler: { action in
                self.ObjectRealm.deleteTovarRealmBase(index: indexPath.row)
                    tableView.reloadData()
                        }))
            
            alertVC.addAction(UIAlertAction(title: "Нет", style: .default, handler: nil))
                self.present(alertVC, animated: true, completion: nil)
                    tableView.reloadData()
                        }
        let swipeActions = UISwipeActionsConfiguration(actions: [performed1])
        return swipeActions
    }
}
