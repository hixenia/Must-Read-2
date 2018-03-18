//
//  MR2MainViewController.swift
//  Must Read 2
//
//  Created by Xenia Rastvorova on 18.03.2018.
//  Copyright © 2018 Kseniia Rastvorova. All rights reserved.
//

import UIKit
import Parse

class MR2MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logOutButtonPressed(_ sender: Any) {
        PFUser.logOut()
        
        if let currentWindow = self.view.window {
            currentWindow.rootViewController?.dismiss(animated: true, completion: nil)
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
