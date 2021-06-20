//
//  CollectionViewController.swift
//  blackstarshop
//
//  Created by Андрей Балобанов on 22.05.2021.
//

// загрузка экрана объектов, выбранной подкатегории

import UIKit

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
extension CollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    
//     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
//               let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
//               let size:CGFloat = (collectionView.frame.size.width - space) / 2.0
//               return CGSize(width: size, height: size)
//     }
       
     
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
        
        let adress = menuArray[indexPath.row].productImages
        let a = adress?[indexPath.row].imageURL
       
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                guard let productViewController = storyboard.instantiateViewController(identifier: "fourVC") as? ProductViewController else { return }
        
        productViewController.nameP = menuArray[indexPath.row].name ?? "NO"
        productViewController.priceP = menuArray[indexPath.row].price ?? "NO"
        productViewController.subTitleP = menuArray[indexPath.row].description ?? "NO"
        
        // Передача изображения
        let imageIcon1 = "http://blackstarshop.ru/"+(a ?? "")
                    if let _ = a {
                        parsingJsonImageUrl(imageIcon1, productViewController.imageP)
                        print(imageIcon1)
                    }
                show(productViewController, sender: nil)
            }
        }
