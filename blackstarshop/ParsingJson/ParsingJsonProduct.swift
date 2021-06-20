//
//  ParsingJsonProduct.swift
//  blackstarshop
//
//  Created by Андрей Балобанов on 30.05.2021.
//

// загрузка JSON выбранного объекта, полсе нажатия подкатегории

import Foundation
import Alamofire


protocol UrlClientProduct {
    func getJson2(completion: @escaping (Result<[Product], Error>) -> Void)
}

class UrlClientloading2: UrlClientProduct {
   
    func getJson2(completion: @escaping (Result<[Product], Error>) -> Void) {
        
        AF.request(urlProduct).responseJSON { response in
            if let objects = response.value, let jsonCoder = objects as? NSDictionary {
                
                var objects3: [Product] = []
                for (_, data) in jsonCoder where data is NSDictionary {

                    // data присутствует
                    
                        if let rootclass = Product(data as! NSDictionary) {
                        objects3.append(rootclass)
                        completion(.success(objects3))
                        }
                }
                    } else {
                completion(.failure(UrlError.noData))
            return
                    }
            }
        }
    }

protocol UrlClientProduct3 {
    func getJson3(completion: @escaping (Result<[Offers], Error>) -> Void)
}

class UrlClientloading3: UrlClientProduct3 {
   
    func getJson3(completion: @escaping (Result<[Offers], Error>) -> Void) {
        
        AF.request(urlProduct).responseJSON { response in
            if let objects = response.value, let jsonCoder = objects as? NSDictionary {
                
                var objects3: [Offers] = []
                for (_, data) in jsonCoder where data is NSDictionary {

                    // data присутствует
                    
                    if let rootclass = Offers(data: data as! NSDictionary) {
                        objects3.append(rootclass)
                        completion(.success(objects3))
                        }
                }
                    } else {
                completion(.failure(UrlError.noData))
            return
                    }
            }
        }
    }
