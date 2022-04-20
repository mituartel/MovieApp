//
//  MovieList.swift
//  Trending Movies
//
//  Created by Maximiliano Ituarte on 01/02/2022.
//

import Foundation

struct MovieList: Codable {
    let title: String
    let overview: String
    let poster_path: String?
    let release_date: String?
    let vote_average: Double
    let id: Int 
    }

