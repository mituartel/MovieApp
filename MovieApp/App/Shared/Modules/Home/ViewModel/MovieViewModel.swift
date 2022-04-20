//
//  MovieViewModel.swift
//  MovieApp
//
//  Created by Maximiliano Ituarte on 01/02/2022.
//


import Foundation

class MoviesViewModel {
    
    private var moviesService: MoviesListService
    private var movies = [MovieList]()
    private var delegate: MoviesListDelegate
    
    init(service: MoviesListService, delegate: MoviesListDelegate) {
        self.moviesService = service
        self.delegate = delegate
    }
    
    func getMovies(){
        moviesService.getMovies {response in
            self.movies = response
            self.delegate.reloadTableView()
        } onError: {
            self.delegate.reloadTableView()
        }
    }
    
    func getMovie(at index: Int) -> MovieList {
        return movies[index]
    }
    
    func getMoviesCount() -> Int {
        return movies.count
        
    }
    
    let imageError : String = "Unexpected error loading image"
}


