//
//  CollectionViewController.swift
//  blackstarshop
//
//  Created by Андрей Балобанов on 22.05.2021.
//

// загрузка экрана объектов, выбранной подкатегории

import UIKit
import Network
import SwiftUI
import AlamofireImage

class CollectionViewController: UIViewController {
      
    @IBOutlet weak var collectionView: UICollectionView!
    
    var menuArray = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
            collectionView.dataSource = self
            collectionView.delegate = self
    }
   
func readAlamofireDataJsonProduct() {
    
    let urlClientLoading = UrlClientloading2()
    
        urlClientLoading.getJson2 { (jsonLoading) in

            switch jsonLoading {
            
            case .success(let root):
                self.menuArray = root
            case .failure:
                self.menuArray = []
        }
    DispatchQueue.main.async {
            self.collectionView?.reloadData()
            }
        }
    }
}

extension CollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    // ячейки в 2 столбца на всех моделях iPhone
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
               let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
               let size: CGFloat = (collectionView.frame.size.width - space) / 2.0
    return CGSize(width: size, height: size)
}
     
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuArray.count
}
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            if let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellColVC", for: indexPath) as? CoolectionViewCell {

            itemCell.menu = menuArray[indexPath.row]
            return itemCell
        }
    return UICollectionViewCell()
}
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                guard let productViewController = storyboard.instantiateViewController(identifier: "fourVC") as? ProductViewController else { return }

        productViewController.product = menuArray[indexPath.row]
        
        productViewController.nameProduct = menuArray[indexPath.row].name ?? "productViewController.nameProduct"
        productViewController.priceProduct = menuArray[indexPath.row].price ?? "productViewController.priceProduct"
        productViewController.imageProductSaveBasket = menuArray[indexPath.row].mainImage ?? "productViewController.mainImage"

        guard let infoProduct2 = menuArray[indexPath.row].offers else { return }
        productViewController.infoProduct = infoProduct2
        
        
        guard let productImages2 = menuArray[indexPath.row].productImages else { return }
            productViewController.imageP = productImages2
           
        show(productViewController, sender: nil)
            }
}
