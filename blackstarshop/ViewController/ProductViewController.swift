//
//  ProductViewController.swift
//  blackstarshop
//
//  Created by Андрей Балобанов on 16.06.2021.
//

import UIKit

class ProductViewController: UIViewController {

    @IBOutlet weak var nameProductLabel: UILabel!
    @IBOutlet weak var priceProductLabel: UILabel!
    @IBOutlet weak var subTitleProductLabel: UILabel!
    @IBOutlet weak var imageProduct: UIImageView!
    
    @IBOutlet weak var buttonOutlet: UIButton!
    
    @IBAction func addToСartButton(_ sender: Any) { }
    
    
    var product: Product?
    
    var imageP: ProductImages?
    
    var sizePR = ""
     var imagePR = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameProductLabel.text = product?.name
        
        subTitleProductLabel.text = product?.description
        
        let image = website + (product?.mainImage)!
        imagePR = image
                if image != "" {
                    parsingJsonImageUrl(image, imageProduct) }
        
        setupGestures()
        
//убираем лишние 0 из цены
        if let myNumber = NumberFormatter().number(from: (product?.price)!) {
            let myInt = myNumber.intValue
            priceProductLabel.text = String(myInt) }
    }

    //создание реагирование на нажатие кнопки
    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped))
        tapGesture.numberOfTapsRequired = 1
        buttonOutlet.addGestureRecognizer(tapGesture)
        
    }
    //появление TableViewController
    @objc
    private func tapped() {
        guard let popVC = storyboard?.instantiateViewController(identifier: "popVC") as? PopTableViewController else { return }
        popVC.modalPresentationStyle = .popover
        let popOverVC = popVC.popoverPresentationController
        popOverVC?.delegate = self
        
        popOverVC?.sourceView = self.view
        popOverVC?.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.maxY, width: 0, height: 0)
//        popOverVC?.sourceView = self.buttonOutlet
//        popOverVC?.sourceRect = CGRect(x: self.buttonOutlet.bounds.midX, y: self.buttonOutlet.bounds.maxY, width: 0, height: 0)
        popVC.preferredContentSize = CGSize(width: view.frame.width, height: view.frame.height / 5.2)

        popVC.infoProduct = (product?.offers)!
        popVC.nameProduct = product?.name ?? ""
        popVC.priceProduct = product?.price ?? ""
        popVC.imageProduct = imagePR
        self.present(popVC, animated: false)
    }

}
extension ProductViewController: UIPopoverPresentationControllerDelegate {
    
    // всегда нужный и обязательный метод для popover
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}

