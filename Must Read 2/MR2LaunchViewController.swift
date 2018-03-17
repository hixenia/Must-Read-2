//
//  MR2LaunchViewController.swift
//  Must Read 2
//
//  Created by Xenia Rastvorova on 18.03.2018.
//  Copyright © 2018 Kseniia Rastvorova. All rights reserved.
//

import UIKit
import Parse

class MR2LaunchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let currentUser = PFUser.current() {
            print("Already logged in: \(currentUser)")
            performSegue(withIdentifier: "openApp", sender: self)
        } else {
            print("Not logged in yet")
            performSegue(withIdentifier: "openAuthorization", sender: self)
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
