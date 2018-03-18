//
//  MRUsersSearchViewController.swift
//  Must Read 2
//
//  Created by Stanislav Rastvorov on 18.03.2018.
//  Copyright © 2018 Kseniia Rastvorova. All rights reserved.
//

import UIKit
import Parse

class MR2UsersSearchViewController: UIViewController, UISearchBarDelegate {
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        title = "Search users"
        
        //        findUsers()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        searchBar.becomeFirstResponder()
    }
    
    func findUsers() {
        if let searchString = searchBar.text {
            let findUser = PFQuery(className: "_User")
            findUser.whereKey("username", contains: searchString.lowercased())
            
            findUser.findObjectsInBackground { (objects, error) in
                if let error = error {
                    print("Error is: \(error.localizedDescription).")
                    self.title = error.localizedDescription
                } else if let objects = objects {
                    print(objects)
                    self.title = "Found users"
                } else {
                    print("What's going on?")
                    self.title = "Mysterious error"
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
    //        print("Search bar activated.")
    //    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("Search cancelled.")
        view.endEditing(true)
        searchBar.text = ""
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("Search completed.")
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("Search button clicked.")
        findUsers()
    }
    
    //    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    //        print("Search is: \(searchBar.text)")
    //    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
