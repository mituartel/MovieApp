//
//  SliderService.swift
//  Trending Movies
//
//  Created by Maximiliano Ituarte on 14/04/2022.
//

import Foundation

import Foundation


class SliderService {
    
//    let webserviceURL = Bundle.main.object(forInfoDictionaryKey: "WEBSERVICE_URL") as! String
//    
//    
//    func getAllSliders(onComplete: @escaping ([SlidersList]) -> Void, onError: @escaping () -> Void) {
//        let URL = Constants().SliderListURL
//        let apiKey = Constants().ApiKey
//        ApiService.shared.get(url: (URL + apiKey)) {response in
//            switch response {
//            case .success(let data):
//                
//                do{
//                    if let data = data{
//                        let decoder = JSONDecoder()
//                        decoder.keyDecodingStrategy = .convertFromSnakeCase
//                        let sliderResponse = try decoder.decode(SliderListResponse.self, from: data)
//                        onComplete(sliderResponse.data)
//                    }else{
//                        onError()
//                    }
//                } catch{
//                    onError()
//                    print(error)
//                }
//                
//            case .failure(_):
//                onError()
//            }
//        }
//    }
}
