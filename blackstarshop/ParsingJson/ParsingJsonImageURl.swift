//
//  ParsingJsonImageURl.swift
//  blackstarshop
//
//  Created by Андрей Балобанов on 12.05.2021.
//



// Загрузка изображений из JSON

import UIKit
import Alamofire




//func loadImage(_ imageView: UIImageView,_ urlString: String) {
//    
//    let imgURL: URL = URL(string: urlString)!
//    
//   
//        URLSession.shared.dataTask(with: imgURL) { (data, respond, error) in
//        guard let data = data, error == nil else { return }
//                            
//        DispatchQueue.main.async (execute: {
//            imageView.image = UIImage(data: data) ?? UIImage(named: "noImage")
//        })
//     
//    }.resume()
//}

func parsingJsonImageUrl(_ image: String, _ imageView: UIImageView)  {

    let noImage = UIImage(named: "noImage")
    
    AF.request(image, method: .get).response { response in
        guard let image = UIImage(data:response.data!) else {
            imageView.image = noImage
                            return }
        DispatchQueue.main.async {
        let imageData = image.jpegData(compressionQuality: 1.0)
            imageView.image = UIImage(data : imageData!)
        }
    }
}

