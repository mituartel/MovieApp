//
//  MovieDetail.swift
//  Trending Movies
//
//  Created by Maximiliano Ituarte on 20/04/2022.
//

import Foundation

struct MovieDetail: Codable {
    let id: Int
    let backdropPath: String?
    let title: String
    let originalLanguage: String
    let popularity: Double
    let releaseDate: String
    let overview: String
}
