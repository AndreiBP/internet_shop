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
    @IBAction func addToСartButton(_ sender: Any) {
        
    }
    
    var nameP = ""
    var priceP = ""
    var subTitleP = ""
    var imageP = UIImageView()
    
    var arrayImage = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameProductLabel.text = nameP
        
//убираем лишние 0 из цены
        if let myNumber = NumberFormatter().number(from: (priceP)) {
            let myInt = myNumber.intValue
            priceProductLabel.text = String(myInt) }
        
        subTitleProductLabel.text = subTitleP
        
        imageProduct.image = imageP.image
        
        setupGestures()
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
        guard let popVC = storyboard?.instantiateViewController(identifier: "popVC") else { return }
        popVC.modalPresentationStyle = .popover
        let popOverVC = popVC.popoverPresentationController
        popOverVC?.delegate = self
        
        popOverVC?.sourceView = self.view
        popOverVC?.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.maxY, width: 0, height: 0)
//        popOverVC?.sourceView = self.buttonOutlet
//        popOverVC?.sourceRect = CGRect(x: self.buttonOutlet.bounds.midX, y: self.buttonOutlet.bounds.maxY, width: 0, height: 0)
        popVC.preferredContentSize = CGSize(width: view.frame.width, height: view.frame.height / 5.2)
       
        
        self.present(popVC, animated: false)
    }

}
extension ProductViewController: UIPopoverPresentationControllerDelegate {
    
    // всегда нужный и обязательный метод для popover
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}

