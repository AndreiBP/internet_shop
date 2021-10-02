//
//  ProductViewController.swift
//  blackstarshop
//
//  Created by Андрей Балобанов on 16.06.2021.
//

import UIKit

class ProductViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        productTableViewSize.reloadData()

    }
    
    @IBOutlet weak var nameProductLabel: UILabel!
    @IBOutlet weak var priceProductLabel: UILabel!
    @IBOutlet weak var subTitleProductLabel: UILabel!
    
    @IBOutlet weak var imageProduct: UICollectionView!
    
    
    @IBOutlet weak var buttonOutlet: UIButton! {
        didSet {
            buttonOutlet.layer.cornerRadius = 10
        }
    }
    
    @IBAction func addToСartButton(_ sender: Any) {
        productTableViewSize.alpha = 1
       
    }
    
    @IBOutlet weak var productTableViewSize: UITableView!
    
    var product: Product?
  
    var imageP = [ProductImages]()
    var imageProductSaveBasket = ""
    
    var infoProduct = [Offers]()

    var nameProduct = ""
    var priceProduct = ""
   // var imageProd = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.productTableViewSize.register(UINib(nibName: "ProductSizeTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductSizeTableViewCell")
        
        nameProductLabel.text = product?.name
        
            subTitleProductLabel.text = product?.description
        
        //убираем лишние 0 из цены
        if let myNumber = NumberFormatter().number(from: (product?.price) ?? "ошибка product?.price") {
            let myInt = myNumber.intValue
                priceProductLabel.text = String(myInt) }

        imageProduct.dataSource = self
        imageProduct.delegate = self
       
        productTableViewSize.alpha = 0
        self.productTableViewSize.dataSource = self
        self.productTableViewSize.delegate = self
    }
}
    
extension ProductViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageP.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductColVCell", for: indexPath) as? ProductColVCell {

            itemCell.imageP2 = imageP[indexPath.row]
           
        return itemCell
    }
        return UICollectionViewCell()
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = imageProduct.frame.size
        return CGSize(width: size.width, height: size.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
}


extension ProductViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoProduct.count
   }

   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductSizeTableViewCell", for: indexPath) as! ProductSizeTableViewCell
        
        cell.infoproduct = infoProduct[indexPath.row]
        
       return cell
   }
}

extension ProductViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//             запись выбранного товара в базу Realm
           let funcRealmBase = FunctionRealmBase.functionRealmBase
        funcRealmBase.saveTovarRealmBase(titleProduct: nameProduct, priceProduct: priceProduct, sizeProduct: infoProduct[indexPath.row].size, iconString: imageProductSaveBasket, colorProduct: product?.colorName ?? "нет цвета")
        productTableViewSize.alpha = 0
    }

}

