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
    
    var menuArray: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
    }


func readAlamofireDataJsonProduct() {
    
    let urlClientLoading = UrlClientloading2()
    
    urlClientLoading.getJson2 { (jsonLoading) in

       // DispatchQueue.main.async {
        switch jsonLoading {
            
            case .success(let root):
                self.menuArray = root
            case .failure:
                self.menuArray = []
               // }
        }
    }
}
    }
extension CollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        menuArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellColVC", for: indexPath) as? CoolectionViewCell {
            
            itemCell.menu = menuArray[indexPath.row]
            
            return itemCell
        }
    return UICollectionViewCell()
}
}
