//
//  PantallaPrincipalViewController.swift
//  MovieApp
//
//  Created by Maximiliano Ituarte on 01/02/2022.
//

import UIKit
import Firebase

class PantallaPrincipalViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    
    private var viewModel = MovieViewModel()
    let movies = [Movie]()

        override func viewDidLoad() {
            
            super.viewDidLoad()
            self.tableView.delegate = self
            tableView.allowsSelection = true
            tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
            
            
            loadPopularMoviesData()
        }
        
        private func loadPopularMoviesData() {
            viewModel.fetchPopularMoviesData { [weak self] in
                self?.tableView.dataSource = self
                self?.tableView.reloadData()
            }
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
    

    // MARK: - TableView
    extension PantallaPrincipalViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return viewModel.numberOfRowsInSection(section: section)
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieTableViewCell
            
            let movie = viewModel.cellForRowAt(indexPath: indexPath)
            cell.setCellWithValuesOf(movie)
            
            return cell
        }
        
    }

    extension PantallaPrincipalViewController: UITableViewDelegate {
        
        
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            print("You selected cell #\(String(describing: [indexPath.row]))!")
           
           // let cell = self.tableView.cellForRow(at: indexPath) as! MovieTableViewCell
            
          //  let destination = PantallaDetalleViewController(nibName: "PantallaDetalleViewController", bundle: nil)
            
      //      destination.movieTitle.text = cell.movieTitle.text
      //      destination.movieRate.text = cell.movieRate.text
            

            let PantallaDetalleViewController = PantallaDetalleViewController()
            PantallaDetalleViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
                present(PantallaDetalleViewController, animated: true, completion: nil)
        }

        
 }


