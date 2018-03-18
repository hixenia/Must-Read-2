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
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let _ = PFUser.current() {
            performSegue(withIdentifier: "openApp", sender: self)
        } else {
            performSegue(withIdentifier: "openAuthorization", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "openApp", let tabBarVC = segue.destination as? UITabBarController {
            tabBarVC.selectedIndex = 2
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        UIApplication.shared.statusBarStyle = .default
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
