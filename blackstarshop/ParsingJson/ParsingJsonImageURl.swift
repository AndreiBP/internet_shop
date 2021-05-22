//
//  ParsingJsonImageURl.swift
//  blackstarshop
//
//  Created by Андрей Балобанов on 12.05.2021.
//

import Foundation
import Alamofire
import UIKit


//func parsingJsonImageUrl2(image: String) -> (UIImage){
//
//    var imageNow = UIImage()
//
//    AF.request(image, method: .get).response { response in
//        switch response.result {
//        case .success(let responseData):
//            imageNow = UIImage(data: responseData!) ?? UIImage(named: "noImage")!
//        case .failure(let error):
//            print("error---",error)
//        }
//    }
//    return imageNow
//}
