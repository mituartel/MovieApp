//
//  PantallaDetalleViewModel.swift
//  Trending Movies
//
//  Created by Maximiliano Ituarte on 20/04/2022.
//

import Foundation

class PantallaDetalleViewModel {
    private var pantallaDetalleService: PantallaDetalleService
    private var delegate: MoviesDetailDelegate
    private var movieUrl: String
    
    init(movieUrl: String ,service: PantallaDetalleService, delegate: MoviesDetailDelegate) {
        self.pantallaDetalleService = service
        self.delegate = delegate
        self.movieUrl = movieUrl
    }
    
    func getMovie() {
            self.delegate.toogleLoading()
        pantallaDetalleService.getMovie(movieUrl: self.movieUrl, onComplete: { movie in
                self.delegate.loadMovieData(movie: movie)
        }, onError: {
            self.delegate.showError()
        })
    }
}
