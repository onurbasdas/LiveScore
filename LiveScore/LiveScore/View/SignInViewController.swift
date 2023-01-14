//
//  ViewController.swift
//  LiveScore
//
//  Created by Onur Başdaş on 14.01.2023.
//

import UIKit
import GoogleSignIn
import Firebase

class SignInViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func googleSignInPressed(_ sender: Any) {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { user, error in
            
            if error != nil {
                return
            }
            
            guard
                let authentication = user?.authentication,
                let idToken = authentication.idToken
            else {
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: authentication.accessToken)
            
            Auth.auth().signIn(with: credential) { authResult, error in
                if authentication.accessToken != "" {
                    self.performSegue(withIdentifier: "toMainSegue", sender: nil)
                } else {
                    print("Error")
                }
            }
        }
    }
}

