//
//  MovieListResponse.swift
//  Trending Movies
//
//  Created by Maximiliano Ituarte on 01/02/2022.
//

struct MovieListResponse: Decodable {
    
    let results: [MovieList]
    private enum CodingKeys: String, CodingKey {
        case results = "results"
    }
}

