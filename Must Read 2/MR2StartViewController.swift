//
//  MR2StartViewController.swift
//  Must Read 2
//
//  Created by Stanislav Rastvorov on 18.03.2018.
//  Copyright © 2018 Kseniia Rastvorova. All rights reserved.
//

import UIKit

class MR2StartViewController: UIViewController {
    // MARK: Outlets
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    // MARK: Variables
    var selectedMode = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        signInButton.layer.borderColor = mustRed.cgColor
        signInButton.layer.borderWidth = 1.0
        signInButton.layer.cornerRadius = 8.0
        signInButton.clipsToBounds = true
        signUpButton.layer.cornerRadius = 8.0
        signUpButton.clipsToBounds = true        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signInButtonPressed(_ sender: Any) {
        selectedMode = "signIn"
        performSegue(withIdentifier: "openAuthorization", sender: self)
    }
    
    @IBAction func signUpButtonPressed(_ sender: Any) {
        selectedMode = "signUp"
        performSegue(withIdentifier: "openAuthorization", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "openAuthorization", let destinationVC = segue.destination as? MR2AuthorizationViewController {
            destinationVC.mode = selectedMode
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
