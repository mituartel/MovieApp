//
//  Model.swift
//  MovieApp
//
//  Created by Maximiliano Ituarte on 01/02/2022.
//

import Foundation

struct MoviesData: Decodable {
    
    let movies: [Movie]
    private enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
}

struct Movie: Decodable {
    
    public var title:String?
    public var year: String?
    public var rate: Double?
    public var posterImage: String?
    public var overview: String?
    
    private enum CodingKeys: String, CodingKey {
        case title, overview
        case year = "release_date"
        case rate = "vote_average"
        case posterImage = "poster_path"
    }
}
