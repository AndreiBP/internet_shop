//
//  ParsingJson.swift
//  blackstarshop
//
//  Created by Андрей Балобанов on 08.05.2021.
//
import Foundation
import Alamofire

enum UrlError: Error {
    case noData
}

protocol UrlClient {
    //func getJson(completion: @escaping ([Struct111]) -> Void)
    func getJson(completion: @escaping (Result<[Struct111], Error>) -> Void)
}

class UrlClientloading: UrlClient {
    func getJson(completion: @escaping (Result<[Struct111], Error>) -> Void) {
        
        AF.request(urlJson).responseJSON { response in
            if let objects = response.value, let jsonCoder = objects as? NSDictionary {
                var objects2: [Struct111] = []
                for (_, data) in jsonCoder where data is NSDictionary {
                    
                    // data присутствует
                    do {
            
                    if let rootclass = Struct111(data: data as! NSDictionary) {
                        objects2.append(rootclass)
                        completion(.success(objects2))
                    }
                        
                    } catch(let error) {
                        print(error)
                        completion(.failure(error))
                }
        }
        
            } else {
                completion(.failure(UrlError.noData))
            return
                    }
            }
    }
}

//protocol UrlClient2 {
//    //func getJson(completion: @escaping ([Struct111]) -> Void)
//    func getJson(completion: @escaping (Result<[Subcategories], Error>) -> Void)
//}
//
//class UrlClientloading2: UrlClient2 {
//    func getJson(completion: @escaping (Result<[Subcategories], Error>) -> Void) {
//
//        AF.request(urlJson).responseJSON { response in
//            if let objects = response.value, let jsonCoder = objects as? NSDictionary {
//                var objects2: [Subcategories] = []
//                for (_, data) in jsonCoder where data is NSDictionary {
//
//                    // data присутствует
//                    do {
//
//                    if let rootclass = Subcategories(data: data as! NSDictionary) {
//                        objects2.append(rootclass)
//                        completion(.success(objects2))
//                    }
//
//                    } catch(let error) {
//                        print(error)
//                        completion(.failure(error))
//                }
//        }
//
//            } else {
//                completion(.failure(UrlError.noData))
//            return
//                    }
//            }
//    }
//}
