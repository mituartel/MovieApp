//
//  PantallaPrincipalViewController.swift
//  MovieApp
//
//  Created by Maximiliano Ituarte on 01/02/2022.
//

import UIKit
import Firebase

protocol MoviesListDelegate {
    func reloadTableView()
}


class PantallaPrincipalViewController: UIViewController, UITableViewDelegate {
    

    @IBOutlet var tableView: UITableView!
    
    
    @IBOutlet var movieSlider: UICollectionView!
    
    private let service = MoviesListService()
    private var viewModel: MoviesViewModel?

        override func viewDidLoad() {
            
            super.viewDidLoad()
            
            self.viewModel = MoviesViewModel(service: self.service, delegate: self)
            self.viewModel?.getMovies()
            
            self.tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
            self.tableView.delegate = self
            self.tableView.dataSource = self
            
            reloadTableView()
            
        }
        
    @IBAction func logOutButtonPressed(_ sender: UIBarButtonItem) {

    do {
      try Auth.auth().signOut()
        
        let PrimeraPantallaViewController = PrimeraPantallaViewController()
            PrimeraPantallaViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        self.present(PrimeraPantallaViewController, animated: true, completion: nil)
    }
        catch let signOutError as NSError {
      print("Error signing out: %@", signOutError)
    }
        
  }
    
}

   extension PantallaPrincipalViewController: MoviesListDelegate {
    func reloadTableView() {
        self.tableView.reloadData()
    }
}
    

    // MARK: - TableView
extension PantallaPrincipalViewController {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let movie = self.viewModel?.getMovie(at: indexPath.row)
//     // let movieDetail = MoviesDetailViewController()
//        let movieId = movie!.id
//        let movieUrl = Constants().MoviesDetailURL + "\(String(describing: movieId))" + "?" + Constants().ApiKey
//      //  movieDetail.movieUrl = movieUrl
//      //  self.navigationController?.pushViewController(movieDetail, animated: true)
    }
}

extension PantallaPrincipalViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return self.viewModel?.getMoviesCount() ?? 0

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieTableViewCell
        
        cell.movieTitle.text = self.viewModel?.getMovie(at: indexPath.row).title
        cell.movieOverview.text = self.viewModel?.getMovie(at: indexPath.row).overview
        cell.movieYear.text = self.viewModel?.getMovie(at: indexPath.row).release_date
        
        let ratePoint = self.viewModel?.getMovie(at: indexPath.row).vote_average
        
        let rateSring = ratePoint?.description
        
        cell.movieRate.text = rateSring
  

       
        
        let posterPath = self.viewModel?.getMovie(at: indexPath.row).poster_path
        let completePath = "https://image.tmdb.org/t/p/w300" + posterPath!

            let imageUrl = URL(string: completePath)
            cell.moviePoster.load(url: imageUrl!)
      
        
        
        return cell
    }
    
    
}
