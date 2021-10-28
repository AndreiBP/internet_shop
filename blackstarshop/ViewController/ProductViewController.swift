//
//  ProductViewController.swift
//  blackstarshop
//
//  Created by Андрей Балобанов on 16.06.2021.
//

import UIKit
import SwiftUI

class ProductViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        productTableViewSize.reloadData()
        productTableViewSize.isHidden = true
    }
    
    @IBOutlet weak var nameProductLabel: UILabel!
    @IBOutlet weak var priceProductLabel: UILabel!
    
    @IBOutlet weak var subTitleProductLabel: UILabel!
        @IBOutlet weak var imageProduct: UICollectionView!
            @IBOutlet weak var ScrollView: UIScrollView!
    
    @IBOutlet var addedProductBasketView: UIView!
        @IBOutlet weak var labeladdedProductBasketView: UILabel!
            @IBOutlet weak var addedProductBasketView2: UIView!
    
    @IBOutlet weak var buttonOutlet: UIButton! {
        didSet {
            buttonOutlet.layer.cornerRadius = 10
        }
    }
    
    @IBAction func addToСartButton(_ sender: Any) {
        productTableViewSize.isHidden = false
    }
    
    @IBOutlet weak var productTableViewSize: UITableView!
    
    var product: Product?
    var imageP = [ProductImages]()
    
    var imageProductSaveBasket = ""
    
    var infoProduct = [Offers]()

    var nameProduct = ""
    var priceProduct = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.productTableViewSize.register(UINib(nibName: "ProductSizeTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductSizeTableViewCell")
        
        nameProductLabel.text = product?.name
        
        subTitleProductLabel.text = product?.description

        //убираем лишние 0 из цены
        if let myNumber = NumberFormatter().number(from: (product?.price) ?? "ошибка product?.price") {
            let myInt = myNumber.intValue
                priceProductLabel.text = "\(myInt) руб." }

        imageProduct.dataSource = self
        imageProduct.delegate = self
       
        self.productTableViewSize.dataSource = self
        self.productTableViewSize.delegate = self

    }
}
    
extension ProductViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if imageP.count == 0 {
            return min(1, (product?.mainImage!.count)!) }
        else {
        return imageP.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductColVCell", for: indexPath) as? ProductColVCell {
            if imageP.count == 0 {
                parsingJsonImageUrl(website + imageProductSaveBasket, itemCell.imageProduct)
            } else {
           itemCell.imageP2 = imageP[indexPath.row]
            }
        return itemCell
    }
        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        let sizeW = UIScreen.main.bounds.width
        let sizeH = UIScreen.main.bounds.height
        return CGSize(width: sizeW, height: sizeH)
    }
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
    
    func addedView() {
        self.view.addSubview(addedProductBasketView)
    addedProductBasketView.alpha = 0.8
        self.addedProductBasketView.center.x = self.view.center.x
    self.addedProductBasketView.center.y = self.view.center.y / 2
    self.addedProductBasketView2.layer.cornerRadius = self.addedProductBasketView2.frame.height / 2
    UIView.animate(withDuration: 1) {
        self.addedProductBasketView.alpha = 0
       // self.view.willRemoveSubview(self.addedProductBasketView)
                                    }
                    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        addedView()
//             запись выбранного товара в базу Realm
           let funcRealmBase = FunctionRealmBase.functionRealmBase
        funcRealmBase.saveTovarRealmBase(titleProduct: nameProduct, priceProduct: priceProduct, sizeProduct: infoProduct[indexPath.row].size, iconString: imageProductSaveBasket, colorProduct: product?.colorName ?? "нет цвета")
        productTableViewSize.isHidden = true
    }
}

