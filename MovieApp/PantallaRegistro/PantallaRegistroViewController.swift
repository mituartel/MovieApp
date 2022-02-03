//
//  PantallaRegistroViewController.swift
//  MovieApp
//
//  Created by Maximiliano Ituarte on 01/02/2022.
//

import UIKit

class PantallaRegistroViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func registerButtonPressed(_ sender: UIButton) {
        let PrincipalViewController = PantallaPrincipalViewController()
            PrincipalViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            present(PrincipalViewController, animated: true, completion: nil)
    }
    
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
