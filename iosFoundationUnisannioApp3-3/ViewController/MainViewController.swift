//
//  MainViewController.swift
//  iosFoundationUnisannioApp3-3
//
//  Created by Ricciardi Gerardo on 30/09/17.
//  Copyright © 2017 Ricciardi Gerardo. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var segueTabBar = "tabBar"
    var segueFirstView = "intro"
    
    override func viewDidAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        if defaults.bool(forKey: "idUser"){
            //utente gia presente, vai alla tabbar
            segueFirstView = segueTabBar
        }
        else{
            //non ci sta nessuno vai all introduzione
            
        }
        self.performSegue(withIdentifier: segueFirstView, sender: self)
        print(segueFirstView)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         Controlla se ci sono i dati dell utente, vai alla tabView
         altrimenti fai l'introduzione
         */
        
        // Do any additional setup after loading the view.
    }
    
    func timeToMoveOn() {
        self.performSegue(withIdentifier: segueFirstView, sender: self)
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
