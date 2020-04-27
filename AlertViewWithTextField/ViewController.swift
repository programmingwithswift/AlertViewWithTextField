//
//  ViewController.swift
//  AlertViewWithTextField
//
//  Created by ProgrammingWithSwift on 2020/04/26.
//  Copyright © 2020 ProgrammingWithSwift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.presentAlertController()
    }

    func presentAlertController() {
        let alertController = UIAlertController(title: "Login",
                                                message: nil,
                                                preferredStyle: .alert)
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Email"
        }

        alertController.addTextField { (textField) in
            textField.placeholder = "Password"
            textField.isSecureTextEntry = true
        }
        
        let continueAction = UIAlertAction(title: "Continue",
                                           style: .default) { [weak alertController] _ in
                                            guard let textFields = alertController?.textFields else { return }
                                            
                                            if let emailText = textFields[0].text,
                                                let passwordText = textFields[1].text {
                                                print("Email: \(emailText)")
                                                print("Password: \(passwordText)")
                                            }
        }

        alertController.addAction(continueAction)
        
        self.present(alertController,
                     animated: true)
    }
}

