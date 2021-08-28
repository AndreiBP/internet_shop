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
  
    @objc func refreshMain() {     //кнопка возврата на главную страницу
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
              //  barBasketItem()
               }
    
    func barBasketItem() {
    //добавляем bar item корзина на вью и переход в корзину
    let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "basket"), for: .normal)

        btn.frame = CGRect(x: 0, y: 0, width: 25, height: 15)
    btn.addTarget(self, action: #selector(basketVC), for: .touchUpInside)
        let item = UIBarButtonItem(customView: btn)
        self.navigationItem.setRightBarButtonItems([item], animated: false)

        item.customView?.widthAnchor.constraint(equalToConstant: 30).isActive = true
        item.customView?.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    @objc func basketVC() {
        let storyboard = storyboard?.instantiateViewController(identifier: "BasketViewController") as! BasketViewController
                navigationController?.pushViewController(storyboard, animated: true)
                    } //конец добавления bar item
 
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
            
                    let imageIcon1 = website+(model.iconImage ?? "ошибка 95")
            
                        parsingJsonImageUrl2(imageIcon1, cell.iconImage)
            
            
                            navigationItem.leftBarButtonItem?.isEnabled = true
            
            //добавляем bar item на главную на вью и выполнение
            let icon = UIBarButtonItem(title: "На главную", style: .plain, target: self, action: #selector(refreshMain))
                navigationItem.leftBarButtonItem = icon
            
                   return cell
        } else {
            
             let model = rootStruct[indexPath.row]
            
                    cell.nameTextCategory.text = model.name
            
                    let imageIcon1 = website+(model.image ?? "ошибка 113")
                    
                    parsingJsonImageUrl2(imageIcon1, cell.iconImage)
            
            navigationItem.leftBarButtonItem?.isEnabled = false
            navigationItem.leftBarButtonItem?.title = ""
    }
            return cell
    }
       
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
   
        if subStruct.count == 0 {
            guard let categori = rootStruct[indexPath.row].subcategories else { return }
            subStruct = categori
            tableView.reloadData() }
        else {
            let threeTableVC = storyboard?.instantiateViewController(identifier: "threeCVC") as! CollectionViewController
            
          
            let product = subStruct[indexPath.row].id ?? "ошибка 133"
                let urlP = urlJsonProduct + (product)
                    urlProduct = urlP
             
        navigationController?.pushViewController(threeTableVC, animated: true)
                threeTableVC.readAlamofireDataJsonProduct()
                    }
            }
    }

