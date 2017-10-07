//
//  ToTabBarViewControllerNew.swift
//  iosFoundationUnisannioApp3-3
//
//  Created by Ricciardi Gerardo on 07/10/17.
//  Copyright © 2017 Ricciardi Gerardo. All rights reserved.
//

import UIKit

class ToTabBarViewControllerNew: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        _ = Timer.scheduledTimer(timeInterval: 0.0, target: self, selector: #selector(timeToMoveOn), userInfo: nil, repeats: false)
        
        
        //        self.performSegue(withIdentifier: "toTabBar", sender: self)
       
        // Do any additional setup after loading the view.
    }

    
    @objc func timeToMoveOn() {
        self.performSegue(withIdentifier: "toTabBar", sender: self)
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
