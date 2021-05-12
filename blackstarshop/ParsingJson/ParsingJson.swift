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
    func getJson(completion: @escaping (Result<RootClass, Error>) -> Void)
}

class UrlClientloading: UrlClient {
    func getJson(completion: @escaping (Result<RootClass, Error>) -> Void) {
        
AF.request(urlJson).response { response in
    guard let data = response.data else {
        
        completion(.failure(UrlError.noData))
        return }
    // data присутствует
       do {
    let decoder = JSONDecoder()
        let jsonLoading = try decoder.decode(RootClass.self, from: data)
        
        completion(.success(jsonLoading))
        //print(jsonLoading)
        
       } catch(let error) {
           print(error)
           completion(.failure(error))
          }
       }
    }
}
