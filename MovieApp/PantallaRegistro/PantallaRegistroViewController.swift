//
//  PantallaRegistroViewController.swift
//  MovieApp
//
//  Created by Maximiliano Ituarte on 01/02/2022.
//

import UIKit
import Firebase

class PantallaRegistroViewController: UIViewController {

    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // ESTA APLICACION FUE REALIZADA CON FIREBASE, EN CASO DE QUERER INGRESAR SIN REGISTRO SIMPLEMENTE COMENTAR TODO MENOS LO QUE ESTA EN LA LINEA 35 A LA 38 EN ESTA FUNCION
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        
        if let email = emailTextField.text , let password = passwordTextField.text {
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let e = error {
                let alert = UIAlertController(title: "Error", message: e.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dissmiss", style: .cancel, handler: { action in
                    print("tapped dissmiss")
                }))
                self.present(alert, animated: true)
            } else {
                let PrincipalViewController = PantallaPrincipalViewController()
                PrincipalViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
                self.present(PrincipalViewController, animated: true, completion: nil)
                        
          }
        }
    }
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

