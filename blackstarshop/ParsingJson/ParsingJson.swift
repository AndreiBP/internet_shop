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
    func getJson(completion: @escaping (Result<[RootStruct], Error>) -> Void)
}

class UrlClientloading: UrlClient {
    func getJson(completion: @escaping (Result<[RootStruct], Error>) -> Void) {
        
        AF.request(urlJson).responseJSON { response in
            if let objects = response.value, let jsonCoder = objects as? NSDictionary {
                var objects2: [RootStruct] = []
                for (_, data) in jsonCoder where data is NSDictionary {
                    
                    // data присутствует
                    do {
            
                        if let rootclass = RootStruct(data as! NSDictionary) {
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

