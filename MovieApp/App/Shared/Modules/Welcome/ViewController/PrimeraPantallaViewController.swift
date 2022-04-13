//
//  ViewController.swift
//  MovieApp
//
//  Created by Maximiliano Ituarte on 01/02/2022.
//

import UIKit

class PrimeraPantallaViewController: UIViewController {

  
    @IBOutlet var registerButton: UIButton!
    
    @IBOutlet var loginButton: UIButton!
    

    
    override func viewDidLoad() {

        
        super.viewDidLoad()
        
    }
   
    
    @IBAction func RegisterButtonPressed(_ sender: UIButton) {
        let PantallaRegistroViewController = PantallaRegistroViewController()
            PantallaRegistroViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            present(PantallaRegistroViewController, animated: true, completion: nil)
    }
    
    @IBAction func LogInButtonPressed(_ sender: UIButton) {
        let PantallaLogInViewController = PantallaLogInViewController()
        PantallaLogInViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            present(PantallaLogInViewController, animated: true, completion: nil)
    }
}

