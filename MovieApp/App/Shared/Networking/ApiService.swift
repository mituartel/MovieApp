//
//  ApiService.swift
//  MovieApp
//
//  Created by Maximiliano Ituarte on 01/02/2022.
//

import Foundation

class ApiService {
    
    private var dataTask: URLSessionDataTask?
    
    func getPopularMoviesData(completion: @escaping (Result<MoviesData, Error>) -> Void) {
        
        let popularMoviesURL = "https://api.themoviedb.org/3/movie/popular?api_key=79e46102e1a3a1e8b4e729b79631cec0&language=en-US&page=1"
        
       // let movieDetail = "https://api.themoviedb.org/3/movie/157336?api_key=79e46102e1a3a1e8b4e729b79631cec0&append_to_response=videos"
        
        guard let url = URL(string: popularMoviesURL) else {return}
        
        
        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            
            if let error = error {
                completion(.failure(error))
                print("DataTask error: \(error.localizedDescription)")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                
                print("Empty Response")
                return
            }
            print("Response status code: \(response.statusCode)")
            
            guard let data = data else {
              
                print("Empty Data")
                return
            }
            
            do {
              
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(MoviesData.self, from: data)
                
              
                DispatchQueue.main.async {
                    completion(.success(jsonData))
                }
            } catch let error {
                completion(.failure(error))
            }
            
        }
        dataTask?.resume()
    }
}
