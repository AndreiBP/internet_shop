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
    
   
    @IBOutlet var PopTV: PopTV!
    
    
    @IBOutlet weak var buttonOutlet: UIButton! {
        didSet {
            buttonOutlet.layer.cornerRadius = 10
        }
    }
    
    @IBAction func addToСartButton(_ sender: Any) {
        addpopTV(desiredView: PopTV)
    }
    
    
    var product: Product?
    
    //var imageP: ProductImages?
    
    var sizePR = ""
     var imagePR = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PopTV.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.width * 0.9, height: self.view.bounds.height * 0.2)
        
            
        nameProductLabel.text = product?.name
        
        
            subTitleProductLabel.text = product?.description
        
                let image = website + (product?.mainImage ?? "ошибка product?.mainImage")
                    imagePR = image
                    parsingJsonImageUrl(image, imageProduct)
        
           // setupGestures()
        
        //убираем лишние 0 из цены
        if let myNumber = NumberFormatter().number(from: (product?.price) ?? "ошибка product?.price") {
            let myInt = myNumber.intValue
                priceProductLabel.text = String(myInt) }

        //добавляем bar item корзина на вью и переход в корзину
//        let btn = UIButton(type: .custom)
//            btn.setImage(UIImage(named: "basket"), for: .normal)
//            btn.frame = CGRect(x: 0, y: 0, width: 25, height: 15)
//            btn.addTarget(self, action: #selector(basketVC), for: .touchUpInside)
//            let item = UIBarButtonItem(customView: btn)
//            self.navigationItem.setRightBarButtonItems([item], animated: false)
//            item.customView?.widthAnchor.constraint(equalToConstant: 30).isActive = true
//            item.customView?.heightAnchor.constraint(equalToConstant: 30).isActive = true
                }
//          @objc func basketVC() {
//            let storyboard = storyboard?.instantiateViewController(identifier: "BasketViewController") as! BasketViewController
//                navigationController?.pushViewController(storyboard, animated: true)
//                    } //конец добавления bar item
       
    func addpopTV(desiredView: UIView) {
        let backgroundView = self.view!
        
        backgroundView.addSubview(desiredView)
        desiredView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        desiredView.alpha = 0
        desiredView.center = CGPoint(x: self.view.bounds.width / 2, y: self.view.bounds.height * 0.8)
        UIView.animate(withDuration: 0.15, animations: {
            desiredView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            desiredView.alpha = 1
            
        })
    }
    
//    //создание реагирование на нажатие кнопки
//    private func setupGestures() {
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped))
//            tapGesture.numberOfTapsRequired = 1
//                buttonOutlet.addGestureRecognizer(tapGesture)
//
//    }
//    //появление TableViewController
//    @objc
//        private func tapped() {
//            guard let popVC = storyboard?.instantiateViewController(identifier: "popVC") as? PopTableViewController else { return }
//                    popVC.modalPresentationStyle = .popover
//                        let popOverVC = popVC.popoverPresentationController
//                        popOverVC?.delegate = self
//                        popOverVC?.sourceView = self.view
//                        popOverVC?.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.maxY, width: 0, height: 0)
////        popOverVC?.sourceView = self.buttonOutlet
////        popOverVC?.sourceRect = CGRect(x: self.buttonOutlet.bounds.midX, y: self.buttonOutlet.bounds.maxY, width: 0, height: 0)
//                        popVC.preferredContentSize = CGSize(width: view.frame.width, height: view.frame.height / 5.2)
//
//                        popVC.infoProduct = (product?.offers)!
//                        popVC.nameProduct = product?.name ?? "ошибка product?.name"
//                        popVC.priceProduct = product?.price ?? "ошибка product?.price"
//                        popVC.imageProduct = imagePR
//                        self.present(popVC, animated: false)
//                            }
//                                }
//extension ProductViewController: UIPopoverPresentationControllerDelegate {
//
//    // всегда нужный и обязательный метод для popover
//    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
//            return .none
//                }
                    }

