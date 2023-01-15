//
//  Helper.swift
//  LiveScore
//
//  Created by Onur Başdaş on 15.01.2023.
//

import UIKit

extension UIViewController {
    func loadHomeScreen(name: String, identifier: String) {
        let storyBoard: UIStoryboard = UIStoryboard(name: name, bundle: nil)
        let mainTabBarController = storyBoard.instantiateViewController(identifier: identifier)
        mainTabBarController.modalPresentationStyle = .fullScreen
        mainTabBarController.modalTransitionStyle = .crossDissolve
        self.present(mainTabBarController, animated: true, completion: nil)
    }
    
}
