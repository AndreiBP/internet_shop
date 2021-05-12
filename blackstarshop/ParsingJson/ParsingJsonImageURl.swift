//
//  ParsingJsonImageURl.swift
//  blackstarshop
//
//  Created by Андрей Балобанов on 12.05.2021.
//

import Foundation
import Alamofire
import AlamofireImage
import UIKit

    func parsingJsonImageUrl(image: String) -> (UIImage){
        
        var imageNow = UIImage()

        AF.download(image).responseData { (response) in
            if let data = response.value {
                let imageData = UIImage(data: data)
                imageNow = imageData ?? #imageLiteral(resourceName: "pirate-scaled-30x60-@2x.png")
            }
        }
        
        return imageNow
    }
        
        
//        AF.download(urlJson).responseData { (response) in
//            switch response.result {
//            case .success(_):
//                let jsonData = try? response.result.get() as? [[String: Any]]?
//                self.vegetablelist = jsonData?
//
//            case .failure(_):
//                print("errrrrrrrrrrrrrrrrr")
//            }
//       ---------------
//AF.request(urlJson).responseImage { response in
//    debugPrint(response)
//
//    print(response.request)
//    print(response.response)
//    debugPrint(response.result)
//
//    if case .success(let image) = response.result {
//        print("image downloaded: \(image)")
//    }
//}
//    }}

