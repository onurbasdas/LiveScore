//
//  ProfileViewController.swift
//  LiveScore
//
//  Created by Onur Başdaş on 15.01.2023.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func logoutAlert() {
        let dialogMessage = UIAlertController(title: "Confirm", message: "Are you sure you want to Logout?", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            
            let firebaseAuth = Auth.auth()
            do {
                try firebaseAuth.signOut()
                self.loadHomeScreen(name: "Main", identifier: "SignInViewController")
            } catch let signOutError as NSError {
                print("Error signing out: %@", signOutError)
            }
        })
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
            print("Cancel button click...")
        }
        dialogMessage.addAction(ok)
        dialogMessage.addAction(cancel)
        self.present(dialogMessage, animated: true, completion: nil)
    }
    
    
    @IBAction func signOutPressed(_ sender: Any) {
        logoutAlert()
    }
    
}
