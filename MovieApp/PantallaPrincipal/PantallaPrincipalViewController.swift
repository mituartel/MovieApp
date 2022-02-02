//
//  PantallaPrincipalViewController.swift
//  MovieApp
//
//  Created by Maximiliano Ituarte on 01/02/2022.
//

import UIKit

class PantallaPrincipalViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    
    private var viewModel = MovieViewModel()

        override func viewDidLoad() {
            super.viewDidLoad()
            
            tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
            
            
            loadPopularMoviesData()
        }
        
        private func loadPopularMoviesData() {
            viewModel.fetchPopularMoviesData { [weak self] in
                self?.tableView.dataSource = self
                self?.tableView.reloadData()
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

