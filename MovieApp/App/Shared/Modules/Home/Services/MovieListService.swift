//
//  MovieListService.swift
//  Trending Movies
//
//  Created by Maximiliano Ituarte on 19/04/2022.
//

import Foundation

class MoviesListService{
    func getMovies(onComplete: @escaping ([MovieList]) -> Void, onError: @escaping () -> Void) {
        let URL = Constants().MoviesListURL
        let apiKey = Constants().ApiKey
        ApiService.shared.get(url: (URL + apiKey)) {response in
            switch response {
            case .success(let data):
                
                do{
                    
                    if let data = data{
                        let decoder = JSONDecoder()
                        let movieResponse = try decoder.decode(MovieListResponse.self, from: data)
                        onComplete(movieResponse.results)
                    }else{
                        onError()
                    }
                } catch{
                    onError()
                    print(error)
                }
                
            case .failure(_):
                onError()
            }
        }
    }
}
