//
//  MR2SignUpViewController.swift
//  Must Read 2
//
//  Created by Xenia Rastvorova on 16.03.2018.
//  Copyright © 2018 Kseniia Rastvorova. All rights reserved.
//

import UIKit
import Parse


class MR2AuthorizationViewController: UIViewController, UITextFieldDelegate {
    // MARK: Outlets
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var changeModeButton: UIButton!
    // MARK: Variables
    var mode = "signUp"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        adjustUI()
        print(mode)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        usernameTextField.becomeFirstResponder()//keyboard appearance
    }
    
    func adjustUI() {
        signUpButton.layer.cornerRadius = 4.0
        if mode == "signUp" {
            signUpButton.setTitle("Sign Up", for: .normal)
            changeModeButton.setTitle("Already signed up? Log in!", for: .normal)
        } else {
            signUpButton.setTitle("Log In", for: .normal)
            changeModeButton.setTitle("Haven't signed up yet? Register here!", for: .normal)
        }
    }
    
    func signUp() {
        view.endEditing(true) // Hide the keyboard
        
        if let username = usernameTextField.text, let password = passwordTextField.text {
            if username == "", password == "" {
                usernameTextField.becomeFirstResponder()
                showMessage(message: "Please fill the text fields.", type: "Error")
            } else if username == "" {
                usernameTextField.becomeFirstResponder()
                showMessage(message: "Username is empty!", type: "Error")
            } else if password == "" {
                passwordTextField.becomeFirstResponder()
                showMessage(message: "Password is empty!", type: "Error")
            } else {
                if mode == "signUp" {
                    let newUser = PFUser()
                    newUser.username = username
                    newUser.password = password
                    
                    newUser.signUpInBackground(block: { (success, error) in
                        if let error = error {
                            self.usernameTextField.becomeFirstResponder()
                            self.showMessage(message: error.localizedDescription, type: "Error")
                        } else if success {
//                            self.showMessage(message: "You've signed up!", type: "Success")
                            self.usernameTextField.text = ""
                            self.passwordTextField.text = ""
                            
                            if let currentWindow = self.view.window {
                                currentWindow.rootViewController?.dismiss(animated: true, completion: nil)
                            }
                        }
                    })
                } else {
                    PFUser.logInWithUsername(inBackground: username, password: password, block: { (currentUser, error) in
                        if let error = error {
                            self.usernameTextField.becomeFirstResponder()
                            self.showMessage(message: error.localizedDescription, type: "Error")
                        } else if let currentUser = currentUser {
                            print("User successfully logged in!\n\(currentUser)")
                            
                            if let currentWindow = self.view.window {
                                currentWindow.rootViewController?.dismiss(animated: true, completion: nil)
                            }
                        }
                    })
                }
            }
        }
        
        print("Sign up button pressed!")
    }
    
    func showMessage(message: String, type: String) {
        var title = "Error"
        
        if type == "Success" {
            title = "Congratulations"
        }
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    
    @IBAction func signUpButtonPressed(_ sender: Any) {
        signUp()
    }
    
    @IBAction func changeModeButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "changeMode", sender: self)
    }
    
    @IBAction func backgroundTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "changeMode",
            let navController = segue.destination as? UINavigationController,
            let destinationVC = navController.topViewController as? MR2AuthorizationViewController {
            if mode == "signUp" {
                destinationVC.mode = "signIn"
            } else {
                destinationVC.mode = "signUp"
            }
        }
    }
    
    // MARK: UITextField Delegates
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            view.endEditing(true)
            signUp()
        }
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == usernameTextField {
            let allowedCharacters = CharacterSet.alphanumerics
            let unwantedStr = string.trimmingCharacters(in: allowedCharacters)
            return unwantedStr.count == 0
        }
        
        return true
    }
    
}
