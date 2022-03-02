//
//  PantallaDetalleViewController.swift
//  MovieApp
//
//  Created by Maximiliano Ituarte on 01/02/2022.
//

import UIKit

class PantallaDetalleViewController: UIViewController {
    
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieCategory: UILabel!
    @IBOutlet weak var movieDuration: UILabel!
    @IBOutlet weak var movieRate: UILabel!
    @IBOutlet weak var movieOverview: UITextView!
    
    var movie: Movie!

    
    override func viewDidLoad() {
        super.viewDidLoad()

    // moviePoster?.image = UIImage(named: movie.posterImage)
       movieTitle?.text = movie?.title
       movieRate?.text = "⭐️ \(String(describing: movie?.rate))/10"
       movieOverview?.text = movie?.overview
    }

    
    @IBAction func goBackButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
