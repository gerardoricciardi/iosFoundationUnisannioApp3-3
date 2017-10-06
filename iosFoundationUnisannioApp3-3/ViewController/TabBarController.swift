//
//  TabBarController.swift
//  iosFoundationUnisannioApp3-3
//
//  Created by Ricciardi Gerardo on 29/09/17.
//  Copyright © 2017 Ricciardi Gerardo. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
       self.tabBar.tintColor = UIColor.white
        
        
       
       
        
        
        

        let defaults = UserDefaults.standard
        for (key, value) in defaults.dictionaryRepresentation() {
            print("\(key) = \(value) \n")
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
