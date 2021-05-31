//
//  ParsingJson.swift
//  blackstarshop
//
//  Created by Андрей Балобанов on 08.05.2021.
//

// загрузка JSON(главная и подкатегория)

import Foundation
import Alamofire

enum UrlError: Error {
    case noData
}

protocol UrlClient {
    func getJson(completion: @escaping (Result<[RootStruct], Error>) -> Void)
}

class UrlClientloading: UrlClient {
    func getJson(completion: @escaping (Result<[RootStruct], Error>) -> Void) {
        
        AF.request(urlJsonCategories).responseJSON { response in
            if let objects = response.value, let jsonCoder = objects as? NSDictionary {
                
                var objects2: [RootStruct] = []
                
                for (_, data) in jsonCoder where data is NSDictionary {
                    
                    // data присутствует
                        if let rootclass = RootStruct(data as! NSDictionary) {
                        objects2.append(rootclass)
                            completion(.success(objects2)) }
                        }
                    //
            } else {
                completion(.failure(UrlError.noData))
            return
                    }
            }
    }
}

