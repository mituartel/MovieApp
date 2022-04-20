//
//  ApiService.swift
//  MovieApp
//
//  Created by Maximiliano Ituarte on 01/02/2022.
//

import Foundation

import Foundation
import Alamofire

class ApiService {
    static let shared = ApiService()
    
    func get(url: String, completion: @escaping (Result<Data?, AFError>) -> Void) {
        AF.request(url).response { response in
            completion(response.result)
            print(response.result)
        }
    }
}
