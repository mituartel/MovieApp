//
//  PantallaDetalleViewController.swift
//  MovieApp
//
//  Created by Maximiliano Ituarte on 01/02/2022.
//

import UIKit

protocol MoviesDetailDelegate {
    func toogleLoading()
    func loadMovieData(movie : MovieDetail)
    func showError()
}

class PantallaDetalleViewController: UIViewController {
    
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieCategory: UILabel!
    @IBOutlet weak var movieDuration: UILabel!
    @IBOutlet weak var movieRate: UILabel!
    @IBOutlet weak var movieOverview: UITextView!
    
    
    private let service = PantallaDetalleService()
    private var viewModel: PantallaDetalleViewModel?
    var movieUrl: String?
    override func viewDidLoad() {
        super.viewDidLoad()

        if let url = movieUrl {
            self.viewModel = PantallaDetalleViewModel(movieUrl: url, service: self.service, delegate: self)
            self.viewModel?.getMovie()
        }
    }
    
    private func setupView() {
        self.title = "Movies Details"
    }
    
    }
    
extension PantallaDetalleViewController: MoviesDetailDelegate {

    func toogleLoading() {
        print("Cargando")
    }
    
    func loadMovieData(movie: MovieDetail) {
        self.movieTitle.text = movie.title
        self.movieOverview.text = movie.overview
        
        if let url = movie.backdropPath, let fullUrl = URL(string: Constants().imageURL + url){
                    self.moviePoster.load(url: fullUrl)
        }
    }
    
    func showError() {
        print("Ha ocurrido un error")
    }
}
