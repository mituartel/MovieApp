//
//  ViewController.swift
//  MovieApp
//
//  Created by Maximiliano Ituarte on 01/02/2022.
//

import UIKit

class PrimeraPantallaViewController: UIViewController {

  
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var registerButton: UIButton!
    
    override func viewDidLoad() {
        
        titleLabel.text = "🍿Movie"
        
        super.viewDidLoad()
        
    }
   
    
    @IBAction func RegisterButtonPressed(_ sender: UIButton) {
        let PantallaRegistroViewController = PantallaRegistroViewController()
        present(PantallaRegistroViewController, animated: true, completion: nil)
    }
    
    @IBAction func LogInButtonPressed(_ sender: UIButton) {
        let PantallaLoginViewController = PantallaLogInViewController()
        present(PantallaLoginViewController, animated: true, completion: nil)
    }
}

